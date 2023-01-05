import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';

class DecoratedInputContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const DecoratedInputContainer({
    Key? key,
    required this.child,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
