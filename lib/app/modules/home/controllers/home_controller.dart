// ignore_for_file: unused_element, unnecessary_overrides, unrelated_type_equality_checks, unused_import, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsd/app/widgets/snackbar_bad_request_widget.dart';
import 'package:jsd/app/widgets/snackbar_good_request_widget.dart';
import 'package:jsd/app/widgets/snackbar_warning_request_widget.dart';

import '../../../settings/helpers.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  var click = false.obs;
  var click2 = false.obs;
  var click3 = false.obs;
  final formKey = GlobalKey<FormState>();
  final expediteur = TextEditingController();
  final beneficiaire = TextEditingController();
  final montant = TextEditingController();
  final typeTransfert = TextEditingController(text: 'airtel_vers_moov');

  // Fonction de validation du formulaire
  void validate() {
     loading.value = !loading.value;
    if (formKey.currentState!.validate()) {
        send();
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
      String indica2 = numero[0] + numero[1] + numero[2];

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

  // Fonction d'envoie
  void send() async {
    try {
      loading.value = !loading.value;
      var url = Uri.parse(Helpers.basUrlApi + 'api_test.php');

      var response = await http.post(url,
          headers: Helpers.headers,
          body:
              '{"type_paiement" : "${typeTransfert.text}","montant" : "${montant.text}","expediteur" : "${expediteur.text}","beneficiaire" : "${beneficiaire.text}" }');

      var result = jsonDecode(response.body);
      
      if (result["response"]) {
        snackBarGood(title: result["title"], message: result["message"]);
      } else {
        snackBarBad(title: result["title"], message: result["message"]);
      }
    } on SocketException {
      loading.value = !loading.value;
      snackBarWarning(
          title: "Pas d'accès internet",
          message: "Vous n'avez pas accès à internet actuellement");
    } on HttpException {
      loading.value = !loading.value;

      snackBarWarning(title: "Erreur", message: "Message non trouvé");
    } on FormatException catch (e) {
      print(e);
      loading.value = !loading.value;

      snackBarWarning(
          title: "Service indisponible",
          message: "le service n'est pas disponible actuellement");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
