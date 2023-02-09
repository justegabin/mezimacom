import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../settings/colors.dart';

Widget contactWidget({controller, contact}) {
  return TextFormField(
    controller: contact,
    keyboardType: TextInputType.number,
    onChanged: (value) {
      controller.verifyNumberGabon(value: value);
    },
    validator: (value) {
      if (value!.isEmpty) {
        return "Veuillez entrer le numero de téléphone !!! ";
      }
      return null;
    },
    inputFormatters: [
      controller.click.value
          ? LengthLimitingTextInputFormatter(9)
          : LengthLimitingTextInputFormatter(1),
      controller.click2.value
          ? LengthLimitingTextInputFormatter(9)
          : LengthLimitingTextInputFormatter(2),
      controller.click3.value
          ? LengthLimitingTextInputFormatter(9)
          : LengthLimitingTextInputFormatter(3),
    ],
    decoration: InputDecoration(
      hintText: "074000000",
      contentPadding:
          const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsSy.orange, width: 1.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: ColorsSy.orange)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(.2),
          width: 1.1,
        ),
      ),
    ),
  );
}
