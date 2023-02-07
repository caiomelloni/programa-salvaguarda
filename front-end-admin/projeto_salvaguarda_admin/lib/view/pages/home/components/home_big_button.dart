import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';

class HomeBigButton extends StatelessWidget {
  final IconData icone;
  final String texto;
  final VoidCallback onPressed;
  final bool? isLoading;
  const HomeBigButton({
    required this.icone,
    required this.texto,
    required this.onPressed,
    this.isLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoadingButton = isLoading ?? false;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () => onPressed(),
      child: SizedBox(
        height: 130,
        width: 130,
        child: isLoadingButton
            ? const Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: AppColors.yellow)))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(icone, size: 70, color: AppColors.yellow),
                      const SizedBox(height: 7),
                      Text(
                        texto,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18, color: AppColors.yellow),
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
