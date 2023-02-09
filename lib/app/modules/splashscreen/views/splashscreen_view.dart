import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsd/app/settings/colors.dart';
import 'package:jsd/app/settings/images.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageSys.logo, height: 180,),
            CircularProgressIndicator(backgroundColor: ColorsSy.blue, color: ColorsSy.grey,)
          ],
        ),
      ),
    );
  }
}
