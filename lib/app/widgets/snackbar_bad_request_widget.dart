import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBarBad({ String? title , String? message }){
    Get.snackbar(title!, message!,
            icon: Icon(Icons.error, color: Colors.white),
            duration: const Duration(seconds: 4),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red
        );
}