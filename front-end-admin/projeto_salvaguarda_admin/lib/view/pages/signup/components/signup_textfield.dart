import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/text_form_field_widget.dart';

class SignUpTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  final bool hide;
  const SignUpTextField({
    Key? key,
    required this.label,
    this.controller,
    required this.onChanged,
    this.hide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      labelText: label,
      primaryColor: AppColors.lightPurple,
      controller: controller,
      onChanged: (value) => onChanged(value),
      hide: hide,
    );
  }
}
