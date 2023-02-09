import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsd/app/settings/images.dart';

import '../../../settings/colors.dart';
import '../../../widgets/contact_widget.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() => Get.back()),
          icon: Icon(Icons.arrow_back, color: ColorsSy.pink,)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
        body: Container(
      padding: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              Image.asset(ImageSys.logo, height: 120),
              SizedBox(height: 10),
              Text(
                "Nom(s)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.nom,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez renseigner le nom";
                  }
                  return null;
                },
                decoration: InputDecoration(
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
              SizedBox(height: 10),
              Text(
                "Prenom(s)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.prenom,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez renseigner le prénom";
                  }
                  return null;
                },
                decoration: InputDecoration(
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
                SizedBox(height: 10),
              Text(
                "Contact",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
                SizedBox(height: 10),
                 
              Obx(() => contactWidget(
                  controller: controller, contact: controller.contact)),

                  SizedBox(height: 10),
              Text(
                "Mot de passe",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: controller.prenom,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez renseigner le mot de passe";
                  }
                  return null;
                },
                decoration: InputDecoration(
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
                                "ENREGISTRER",
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                  )))),
            ],
          )),
    ));
  }
}
