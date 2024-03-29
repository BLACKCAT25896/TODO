import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/widget/custom_check_box.dart';
import 'package:get/get.dart';

class TodoCard extends StatelessWidget {
  final String? time;
  final String? todoTitle;
  final bool isCompleted;
  final String? timeGrope;
  final Function()? onDelete;
  final Function(bool)? onCompleted;
  const TodoCard({
    super.key, this.time, this.todoTitle, this.onDelete, this.onCompleted, this.isCompleted =false, this.timeGrope ,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(timeGrope != null)...[
          Text(timeGrope!.tr,style: Get.textTheme.titleMedium!.copyWith(color: Get.theme.hintColor,),),
          const SizedBox(height: 20,)
        ],
        Container(height:120, width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(color: Get.theme.colorScheme.onSurface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Get.theme.hintColor.withOpacity(0.30),blurRadius: 20)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(child: Text(time??"",maxLines: 1, style: Get.textTheme.titleMedium!.copyWith(color: Get.theme.hintColor,),)),
                const SizedBox(width: 10,),
                InkWell(onTap: onDelete,
                    child: const Icon(Icons.delete_outlined,color: Colors.red,size: 25,))
              ],),
              const SizedBox(height: 12,),
              Row(children: [
                CustomCheckBox(value: isCompleted, onChanged: (value) {
                  if(onCompleted!=null){
                  onCompleted!.call(value);
                }},),
                const SizedBox(width: 12,),
                Expanded(child: Text(todoTitle??"",style: Get.textTheme.titleLarge!.copyWith(fontSize: 24,fontWeight: FontWeight.w500,
                  decoration: isCompleted? TextDecoration.lineThrough: TextDecoration.none,
                  decorationThickness: 1.5,
                  decorationColor: isCompleted?  Get.theme.colorScheme.surface.withOpacity(0.4):Get.theme.colorScheme.surface,
                  color: isCompleted?  Get.theme.colorScheme.surface.withOpacity(0.4):Get.theme.colorScheme.surface ,)))
              ],)

            ],
          ),
        ),
      ],
    );
  }
}