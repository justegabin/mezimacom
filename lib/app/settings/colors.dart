// ignore_for_file: file_names
import 'package:flutter/material.dart';

class  ColorsSy{

  static Color orange = const Color(0xFFe36139);
  static Color grey = const Color(0xFFeff3fa); 
  static Color blue = const Color(0xFF009fe2);
  static Color skyblue = const Color(0xFFa5d9f7);
  static Color violet = const Color(0xFF562f88);
  static Color pink = const Color(0xFFa61584);

  static const MaterialColor pinkSy = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFF562f88),
      100: Color(0xFF562f88),
      200: Color(0xFF562f88),
      300: Color(0xFF562f88),
      400: Color(0xFF562f88),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF562f88),
      700: Color(0xFF562f88),
      800: Color(0xFF562f88),
      900: Color(0xFF562f88),
    },
  );
  static const int _bluePrimaryValue = 0xFF562f88;
}