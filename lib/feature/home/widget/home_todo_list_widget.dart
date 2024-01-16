import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/model/todo_model.dart';
import 'package:flutter_boilerplate/feature/home/controller/home_controller.dart';
import 'package:flutter_boilerplate/feature/home/widget/todo_card.dart';

class HomeTodoListWidget extends StatelessWidget {
  final HomeController homeController;
  const HomeTodoListWidget({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    String? lastTimeGroup;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: homeController.todoData.length,
      itemBuilder: (context, index) {
        TodoModel todo = homeController.todoData.elementAt(index);

        String? timeGroup = homeController.getTimeGroup(todo.todoDate);

        if (index == 0 || timeGroup != lastTimeGroup) {
          lastTimeGroup = timeGroup;
          return TodoCard(
            timeGrope: timeGroup,
            time: todo.todoTime,
            todoTitle: todo.todoTitle,
            isCompleted: todo.isCompleted ?? false,
            onDelete: () => homeController.deleteTodo(index),
            onCompleted: (value) => homeController.setCompletedStatusByIndex(index, value: value),
          );
        } else {
          return TodoCard(
            timeGrope: null,
            time: todo.todoTime,
            todoTitle: todo.todoTitle,
            isCompleted: todo.isCompleted ?? false,
            onDelete: () => homeController.deleteTodo(index),
            onCompleted: (value) => homeController.setCompletedStatusByIndex(index, value: value),
          );
        }
      },
    );
  }
}
//Completed

