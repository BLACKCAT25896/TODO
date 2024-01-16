
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/model/todo_model.dart';
import 'package:flutter_boilerplate/feature/home/domain/repo/home_repo.dart';
import 'package:flutter_boilerplate/helper/display_helper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/model/categories_model.dart';

class HomeController extends GetxController implements GetxService {
  HomeRepo homeRepo;
  HomeController(this.homeRepo);

  List<TodoModel> todoData = [];

  TextEditingController todoController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  final todoFormKey = GlobalKey<FormState>();

  String? todoDate;
  String? todoTime;
  bool isImportant = false;

  void toggleImportant(){
    isImportant = !isImportant;
    update();
  }

  Future<void> pickTodoDateTime(BuildContext context,{required bool isTime}) async{
    String? time;
    String? date;
    if(isTime){
      time = await pickTime(context);
      date = await pickDate(context);
    }else{
      date = await pickDate(context);
      time = await pickTime(context);
    }
    if(date != null){todoDate = date;}
    if(time != null){todoTime = time;}

    update();

  }

  void clearAddTodoData(){
    todoDate = null;
    todoTime = null;
    isImportant = false;
    todoController.clear();
    categoryController.clear();
  }

  void addNewToDo(){
    todoData.add(TodoModel(
        inImportant: isImportant,
        todoDate: todoDate,
        todoTime: todoTime,
        todoTitle: todoController.text,
        category: categoryController.text));
    Get.back();
    clearAddTodoData();
    sortTodoData();
    update();
  }

  void sortTodoData() {
    todoData.sort((a, b) {
      int dateComparison = (a.todoDate ?? '').compareTo(b.todoDate ?? '');
      if (dateComparison != 0) {
        return dateComparison;
      }
      return (a.todoTime ?? '').compareTo(b.todoTime ?? '');
    });
  }

  String? getTimeGroup (String? date){
    if(date == null){return null;}
    DateTime currentDate = DateTime.now();
    DateTime todoDate = DateFormat('dd-MM-yyyy').parse(date);
    String timeGroup;
    if (todoDate.isAtSameMomentAs(currentDate)) {
      timeGroup = "THINGS TO DO TODAY";
    } else if (todoDate.isAfter(currentDate)) {
      timeGroup = "THINGS TO DO TOMORROW";
    } else {
      timeGroup = "ALL THINGS TO DO";
    }
    return timeGroup;

  }

  List<CategoriesModel> getCategories() {
    Map<String, CategoriesModel> categoryMap = {};

    for (TodoModel todo in todoData) {
      String categoryName = todo.category ?? 'Uncategorized';

      CategoriesModel category = categoryMap[categoryName] ?? CategoriesModel(
        categoriesName: categoryName,
        totalCompleted: 0,
        totalTodo: 0,
      );

      category.totalTodo += 1;

      if (todo.isCompleted == true) {
        category.totalCompleted += 1;
      }

      categoryMap[categoryName] = category;
    }

    List<CategoriesModel> categoriesList = categoryMap.values.toList();
    return categoriesList;
  }

  void setCompletedStatusByIndex(int index, {required bool value}) {
    if (index >= 0 && index < todoData.length) {
      todoData[index] = todoData[index].copyWith(isCompleted: value);
      update();
    }
  }

  void deleteTodo(int index){
    todoData.removeAt(index);
    update();
  }

}