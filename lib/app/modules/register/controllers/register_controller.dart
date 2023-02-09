// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {


  var loading = false.obs;
  var click = false.obs;
  var click2 = false.obs;
  var click3 = false.obs;
  final formKey = GlobalKey<FormState>();
  final nom = TextEditingController();
  final prenom = TextEditingController();
  final contact = TextEditingController();
  final password = TextEditingController();


  // Validation du formulaire
  void validate(){
      loading.value = !loading.value;
    if (formKey.currentState!.validate()) {
          if (loading.value) {
            loading.value = !loading.value;
          }
    }
  }

    // Fonction de verification du numero de téléphone
  void verifyNumberGabon({value}) {
    String numero = value.toString();

    if (numero.isNotEmpty && numero.length == 1) {

      if (numero[0] == "0") {
        click.value = true;
      } else {
        click.value = false;
        Get.snackbar('Erreur !!',
            'Veuillez renseigner un  "0" pour la numérotation du Gabon',
            icon: const Icon(Icons.error, color: Colors.white),
            duration: const Duration(seconds: 4),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red);
      }
    }

    if (numero.isNotEmpty && numero.length == 2) {
        String indica1 = numero[0] + numero[1];
      switch (indica1) {
        case "06":
          click2.value = true;
          break;
        case "07":
          click2.value = true;
          break;
        default:
          click2.value = false;
          Get.snackbar('Erreur !!',
              'Veuillez renseigner un  "06" / "07" pour la numérotation du Gabon',
              icon: const Icon(Icons.error, color: Colors.white),
              duration: const Duration(seconds: 4),
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red);
      }
    }

    if (numero.isNotEmpty && numero.length == 3) {

      String indica2 = numero[0] + numero[1] + numero[2] ;

      switch (indica2) {
        case "060":
          click3.value = true;
          break;
        case "062":
          click3.value = true;
          break;
        case "065":
          click3.value = true;
          break;
        case "066":
          click3.value = true;
          break;
        case "074":
          click3.value = true;
          break;
        case "076":
          click3.value = true;
          break;
        case "077":
          click3.value = true;
          break;
        default:
          click3.value = false;
          Get.snackbar('Erreur !!',
              'veuillez renseigner un  "060" / "062" / "065" / "066" / "074" / "076" / "077" ',
              icon: const Icon(Icons.error, color: Colors.white),
              duration: const Duration(seconds: 4),
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red);
      }
    }
  }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
