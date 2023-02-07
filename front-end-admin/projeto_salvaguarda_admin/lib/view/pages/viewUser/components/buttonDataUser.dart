import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';

class ButtonDataUser extends StatelessWidget {
  final IconData icone;
  final String texto;
  final VoidCallback onPressed;
  final bool? isLoading;
  final bool? isLoading2;
  const ButtonDataUser({
    required this.icone,
    required this.texto,
    required this.onPressed,
    this.isLoading,
    this.isLoading2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoadingButton;
    if (isLoading2 != null) {
      isLoadingButton = (isLoading ?? false) && (isLoading2!);
    } else {
      isLoadingButton = isLoading ?? false;
    }
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
