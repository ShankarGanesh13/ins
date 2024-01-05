import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class MySnackbar {
  static SnackBar showSnackBar(
      {required BuildContext context,
      required String message,
      required int duration}) {
    //print(message);
    return SnackBar(
      duration: Duration(seconds: duration),
      backgroundColor: const Color(0xff161F31),
      content: Text(
        message,
        style: AppFonts.w500white14,
      ),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }
}
