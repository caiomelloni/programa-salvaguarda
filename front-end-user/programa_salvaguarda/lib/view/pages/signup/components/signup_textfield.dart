import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/view/components/text_form_field_widget.dart';

class SignUpTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  final bool hide;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  const SignUpTextField({
    Key? key,
    required this.label,
    this.controller,
    required this.onChanged,
    this.hide = false,
    this.inputFormatters, this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      labelText: label,
      primaryColor: AppColors.lightPurple,
      controller: controller,
      onChanged: (value) => onChanged(value),
      hide: hide,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
    );
  }
}
