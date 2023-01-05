import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool? isLoading;
  final VoidCallback onPressed;
  const ElevatedButtonWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoadingButton = isLoading ?? false;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.lightPurple),
      child: SizedBox(
        width: double.infinity,
        child: isLoadingButton
            ? const Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: AppColors.yellow)))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    child: Icon(
                      icon,
                      size: 30,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
      ),
      onPressed: () => onPressed(),
    );
  }
}
