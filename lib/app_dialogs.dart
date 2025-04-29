import 'package:flutter/material.dart';
import 'package:reusable_dialog/custom_alert_dialog.dart';

class AppDialog {
  static void warning(
      {required BuildContext context,
      String? title,
      String? msg,
      required VoidCallback onOk}) {
    return CustomDialog.show(
      context: context,
      title: title,
      okBtnTxt: "Continue process",
      okBtnTxtColor: Colors.red,
      cancelBtnTxtColor: Colors.blueGrey[900],
      onOk: onOk,
      child: Text(msg ?? ''),
    );
  }
}
