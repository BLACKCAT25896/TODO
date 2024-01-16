import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helper/toaster.dart';
import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';

class AddToDoButton extends StatelessWidget {
  const AddToDoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (homeController) {
          return ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add Todo",style: Get.textTheme.titleMedium!.copyWith(color:Get.theme.colorScheme.onSurface ),),
                const SizedBox(width: 4,),
                Icon(Icons.add,color:Get.theme.colorScheme.onSurface,)
              ],
            ),
            onPressed: () {
              if(homeController.todoFormKey.currentState!.validate()){
                if(homeController.todoDate == null){
                  showCustomToaster("Please Add ToDo Date");
                }else if(homeController.todoTime == null){
                  showCustomToaster("Please Add ToDo Time");
                }else{
                  homeController.addNewToDo();
                }
              }

            },);
        }
    );
  }
}
