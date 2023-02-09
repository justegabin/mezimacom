import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:select_form_field/select_form_field.dart';
import '../../../data/data.dart';
import '../../../routes/app_pages.dart';
import '../../../settings/colors.dart';
import '../../../settings/images.dart';
import '../../../widgets/contact_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              Center(
                child: Image.asset(
                  ImageSys.trans,
                  height: 110,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Sélectionner le type de transfert",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SelectFormField(
                controller: controller.typeTransfert,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez choisir le type de transfert";
                  }
                  return null;
                },
                type: SelectFormFieldType.dropdown,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: ColorsSy.blue,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsSy.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: ColorsSy.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(.2),
                      width: 1.1,
                    ),
                  ),
                ),
                labelText: 'Airtel Money -> Moov Money',
                items: DataApp.items,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 20),
              Text(
                "Numéro de l'expéditeur",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Obx(() => contactWidget(
                  controller: controller, contact: controller.expediteur)),
              SizedBox(height: 20),
              Text(
                "Numéro de bénéficiaire",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Obx(() => contactWidget(
                  controller: controller, contact: controller.beneficiaire)),
              SizedBox(height: 20),
              Text(
                "Montant",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.montant,
                inputFormatters: [LengthLimitingTextInputFormatter(6)],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez renseigner le montant";
                  }

                  if (int.parse(controller.montant.text) < 100) {
                    return 'Le montant minimum 100 FCFA ';
                  }

                  if (int.parse(controller.montant.text) > 100000) {
                    return 'Le maximal 100.000 FCFA';
                  }

                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffix: Text('FCFA'),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsSy.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: ColorsSy.blue)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(.2),
                      width: 1.1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(() => (GestureDetector(
                  onTap: () {
                    controller.loading.value ? null : controller.validate();
                  },
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorsSy.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: controller.loading.value
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                color: ColorsSy.blue,
                              )
                            : const Text(
                                "ENVOYER",
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                  )))),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppPages.REGISTER);
                      },
                      child: Text('Se connecter',
                          style:
                              TextStyle(color: ColorsSy.blue, fontSize: 18))),
                  Text("Ou",
                      style: TextStyle(
                          color: ColorsSy.pink,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppPages.REGISTER);
                      },
                      child: Text('S\'inscrire',
                          style: TextStyle(color: ColorsSy.blue, fontSize: 18)))
                ],
              )
            ],
          )),
    ));
  }
}
