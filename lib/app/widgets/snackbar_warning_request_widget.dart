import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBarWarning({ String? title , String? message }){
         Get.snackbar(title!, message!,
          icon: Icon(Icons.warning, color: Colors.black),
          duration: const Duration(seconds: 4),
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.yellow
      );
}