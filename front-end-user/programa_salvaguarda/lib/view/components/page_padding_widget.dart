import 'package:flutter/material.dart';

class PagePaddingWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry extraPadding;
  const PagePaddingWidget({
    super.key,
    required this.child,
    this.extraPadding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: extraPadding,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: child,
      ),
    );
  }
}
