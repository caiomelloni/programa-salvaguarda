import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const TextButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
      ),
      onPressed: () => onPressed(),
      child: Text(title),
    );
  }
}
