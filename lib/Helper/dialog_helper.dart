

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogMessage{
  static void showErrorMessage({String title = 'Error', String description = 'Something went wrong'})
  {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headline4,
              ),
              Text(
                description ,
                style: Get.textTheme.headline4,
              ),
              ElevatedButton(
                onPressed: (){
                //if (Get.isDialogOpen) Get.back();
              }, 
              child: const Text('Okay'),
              ),
            ],
            ),
        ),
      )
    );
  }
}