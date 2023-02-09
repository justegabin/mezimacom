// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loading();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  // Chargement de l'application 
   Future <void> loading() async{
     Timer(Duration(seconds: 5), () {
      Get.offAndToNamed(AppPages.ONBOARDING);
    });
  }
}
