import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';

Future<void> showAlertDialog(
    {required BuildContext context,
    required String title,
    required String buttonText,
    required Widget body,
    bool cancelButton = false,
    VoidCallback? onPressed}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(color: AppColors.orange),
        ),
        content: SingleChildScrollView(child: body),
        actions: <Widget>[
          if (cancelButton) ...[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                "Cancelar",
                style: TextStyle(
                  color: AppColors.lightPurple,
                ),
              ),
            )
          ],
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(
                color: AppColors.lightPurple,
              ),
            ),
          ),
        ],
      );
    },
  );
}
