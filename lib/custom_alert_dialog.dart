import 'package:flutter/material.dart';
import 'package:reusable_button/app_txt_btn.dart';

class CustomDialog {
  static final CustomDialog _instance = CustomDialog.internal();
  static late BuildContext _context;

  factory CustomDialog() => _instance;

  CustomDialog.internal();

  static void show({
    required BuildContext context,
    String? title,
    Widget? child,
    String? okBtnTxt,
    String? cancelBtnTxt,
    Color? okBtnTxtColor,
    Color? cancelBtnTxtColor,
    Function? onCancel,
    required VoidCallback onOk,
  }) {
    try {
      _context = context;

      showDialog(
        context: context,
        builder: (BuildContext cntx) {
          final theme = Theme.of(cntx);

          // Cancel button
          final Widget cancelBtn = cancelBtnTxt == null
              ? const SizedBox.shrink()
              : TextButton(
                  onPressed: onCancel as void Function()? ?? cancelDialog,
                  child: Text(
                    cancelBtnTxt,
                    style: TextStyle(color: cancelBtnTxtColor ?? Colors.grey),
                  ),
                );

          // OK button
          final Widget okBtn = okBtnTxt == null
              ? const SizedBox.shrink()
              : AppTxtBtn(
                  onPressed: onOk,
                  btnTextColor: okBtnTxtColor ?? Colors.green[900],
                  btnText: okBtnTxt,
                );

          return AlertDialog(
            title: Text(
              title ?? '',
              style:
                  theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ) ??
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            content: child,
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[cancelBtn, const SizedBox(width: 12), okBtn],
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 0.0,
          );
        },
      );
    } catch (e) {
      debugPrint('CustomDialog | show | error: $e');
    }
  }

  static void cancelDialog() => Navigator.of(_context).pop();
}
