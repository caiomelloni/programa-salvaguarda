import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? labelText;
  final TextInputType? keyboardType;
  final Color primaryColor;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final bool? enabled;
  final bool hide;
  final List<TextInputFormatter>? inputFormatters;
  const TextFormFieldWidget({
    Key? key,
    this.labelText,
    this.keyboardType,
    this.primaryColor = AppColors.white,
    this.controller,
    this.onChanged,
    this.enabled,
    this.hide = false,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      obscureText: hide,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        focusColor: primaryColor,
        labelStyle: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            decorationColor: AppColors.yellow),
      ),
      style: TextStyle(fontSize: 20, color: primaryColor),
      cursorColor: primaryColor,
      onChanged: (value) => onChanged?.call(value),
      inputFormatters: inputFormatters,
    );
  }
}
