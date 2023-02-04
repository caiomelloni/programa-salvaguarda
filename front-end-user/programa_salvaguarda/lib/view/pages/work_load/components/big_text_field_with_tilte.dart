import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/view/pages/work_load/components/big_textfield.dart';

class BigTextFieldWithTitleWidget extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final bool readOnly;
  const BigTextFieldWithTitleWidget({
    Key? key,
    required this.title,
    this.hintText,
    required this.controller,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(color: AppColors.orange, fontSize: 27),
        ),
        const SizedBox(width: 5),
        BigTextFieldWidget(
          hintText: hintText,
          controller: controller,
          readOnly: readOnly,
        )
      ],
    );
  }
}
