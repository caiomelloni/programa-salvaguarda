import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';

class HomeBigButton extends StatelessWidget {
  final IconData icone;
  final String texto;
  final VoidCallback onPressed;
  const HomeBigButton({
    required this.icone,
    required this.texto,
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: SizedBox(
        height: 130,
        width: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(icone, size: 70, color: AppColors.yellow),
                const SizedBox(height: 7),
                Text(
                  texto,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: AppColors.yellow),
                )
              ],
            )
          ],
        ),
      ),
      onPressed: () => onPressed(),
    );
  }
}
