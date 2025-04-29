// import 'package:core/styles/padding_constant.dart';
// import 'package:core/styles/google_ubuntu_fonts_txt_styles.dart';
// import 'package:core/widgets/button/app_txt_btn.dart';
import 'package:flutter/material.dart';
import 'package:app_style/app_style.dart';
import 'package:reusable_button/app_txt_btn.dart';

class CustomDialog {
  static final CustomDialog _instance = CustomDialog.internal();
  static late BuildContext _context;

  factory CustomDialog() => _instance;

  CustomDialog.internal();

  static void show(
      {required BuildContext context,
      String? title,
      Widget? child,
      String? okBtnTxt,
      String? cancelBtnTxt,
      Color? okBtnTxtColor,
      Color? cancelBtnTxtColor,
      Function? onCancel,
      required VoidCallback onOk}) {
    try {
      _context = context;

      showDialog(
          context: context,
          builder: (BuildContext cntx) {
            // set up the button
            final Widget cancelBtn = cancelBtnTxt == null
                ? TextButton(
                    onPressed: () {},
                    child: Container(),
                  )
                : TextButton(
                    onPressed: onCancel as void Function()? ?? cancelDialog,
                    child: Text(
                      cancelBtnTxt,
                      style: TextStyle(color: cancelBtnTxtColor),
                    ));

            final Widget okBtn = okBtnTxt == null
                ? TextButton(
                    onPressed: () {},
                    child: Container(),
                  )
                : AppTxtBtn(
                    onPressed: onOk,
                    btnTextColor: okBtnTxtColor ?? Colors.green[900],
                    btnText: okBtnTxt,
                  );

            return AlertDialog(
              title: Text(
                title ?? '',
                style: AppTxtStyles.kMidTitleTextStyle,
              ),

              /* Here add your custom widget  */
              content: child,
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    cancelBtn,
                    okBtn,
                  ],
                )
              ],
              shape: const RoundedRectangleBorder(
                  // borderRadius: BorderRadius.circular(kHPadding),
                  ),
              elevation: 0.0,
            );
          });
    } catch (e) {
      debugPrint('CustomDialog | show | error: $e ');
    }
  }

  static void cancelDialog() => Navigator.of(_context).pop();
}
// Token saved error
