import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Good Evening,",style: Get.textTheme.displayMedium!.copyWith(color: Get.theme.colorScheme.surface,fontWeight: FontWeight.w500),),
        const SizedBox(height: 10,),
        Text("John Due!",style: Get.textTheme.displayLarge!.copyWith(fontSize: 38, color: Get.theme.colorScheme.surface,),),

      ],
    );
  }
}
