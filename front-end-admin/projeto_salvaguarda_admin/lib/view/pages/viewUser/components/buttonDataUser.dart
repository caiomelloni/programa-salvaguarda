import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';

class ButtonDataUser extends StatelessWidget {
  final IconData icone;
  final String texto;
  final VoidCallback onPressed;
  final bool? isLoading;
  const ButtonDataUser({
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
        backgroundColor: const Color.fromRGBO(191, 127, 225, 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 48,
        width: 300,
        child: isLoadingButton
            ? const Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: AppColors.yellow)))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icone,
                    size: 30,
                    color: AppColors.yellow,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    texto,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontSize: 20, color: AppColors.yellow),
                  )
                ],
              ),
      ),
    );
  }
}
