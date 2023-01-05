import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';

Future<void> showAlertDialog(
    {required BuildContext context,
    required String title,
    required Icon icone1,
    required Icon icone2,
    required Widget body,
    bool twoicons = false,
    VoidCallback? onPressed1,
    VoidCallback? onPressed2}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color.fromARGB(255, 211, 211, 211),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.lightPurple),
        ),
        content: SingleChildScrollView(
          child: SizedBox(width: 250, height: 100, child: body),
        ),
        actions: twoicons
            ? <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: onPressed1,
                      icon: icone1,
                    ),
                    IconButton(
                      onPressed: onPressed2,
                      icon: icone2,
                    ),
                  ],
                ),
              ]
            : <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: onPressed1,
                      icon: icone1,
                    ),
                  ],
                ),
              ],
      );
    },
  );
}
