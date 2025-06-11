import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ShowMessage {
  static void showErrorMessage(BuildContext context, String error,
      {int duration = 3}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Flushbar(
        title: "Error",
        backgroundColor: Colors.redAccent,
        message: error,
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        borderRadius: BorderRadius.circular(20),
        duration: Duration(seconds: duration),
      ).show(context);
    });
  }

  static void showSuccessMessage(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Flushbar(
        title: "Success",
        backgroundColor: Colors.greenAccent,
        message: message,
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        borderRadius: BorderRadius.circular(20),
        duration: const Duration(seconds: 3),
      ).show(context);
    });
  }
}
