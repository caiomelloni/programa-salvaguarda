import 'package:flutter/cupertino.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';

class SafeAreaWidget extends StatelessWidget {
  final Widget child;
  const SafeAreaWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightPurple,
      child: SafeArea(child: child),
    );
  }
}
