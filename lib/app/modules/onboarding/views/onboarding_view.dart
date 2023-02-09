import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:jsd/app/routes/app_pages.dart';
import 'package:jsd/app/settings/colors.dart';

import '../../../settings/images.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          color: ColorsSy.blue, fontWeight: FontWeight.bold, fontSize: 22.0),
      bodyTextStyle:
          TextStyle(color: Colors.black.withOpacity(.7), fontSize: 20));

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: SvgPicture.asset(ImageSys.transfert, height: 120, color: ColorsSy.blue,),
          title: 'Transfert d\'argent ',
          body:
              "Effectuer des transafert d'agent \n Airtel Money  ➤  Moov Money \n Moov Money  ➤  Airtel Money",
          decoration: pageDecoration),
      PageViewModel(
          image: SvgPicture.asset(ImageSys.dashboard,height: 120, color: ColorsSy.blue,),
          title: 'Gestion des transactions ',
          body:
              "Avoir le suivi de ses transaction en ouvrant un compte utilisateur",
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset(
            ImageSys.logo,
            height: 180,
          ),
          title: 'COMMENCER',
          body: "let's Goooooo",
          decoration: pageDecoration),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: getPages(),
      done: Text(
        "Commencer",
        style: TextStyle(color: ColorsSy.pink, fontSize: 16.0),
      ),
      onDone: () {
        Get.offAndToNamed(AppPages.INITIAL);
      },
      next: Text("Suivant",
          style: TextStyle(color: ColorsSy.pink, fontSize: 16.0)),
      showNextButton: true,
      showSkipButton: true,
      skip: Text(
        "Passer",
        style: TextStyle(color: ColorsSy.pink, fontSize: 16.0),
      ),
      onSkip: () {
        Get.offAndToNamed(AppPages.INITIAL);
      },
      dotsDecorator: DotsDecorator(
          size: const Size.square(15.0),
          activeSize: const Size(15.0, 15.0),
          activeColor: ColorsSy.pink,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0))),
    ));
  }
}
