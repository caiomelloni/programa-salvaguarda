import 'package:flutter/material.dart';

class ScrollableRow extends StatelessWidget {
  final List<Widget> children;
  const ScrollableRow({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(children: [
          const SizedBox(width: 30),
          ...children,
          const SizedBox(width: 30)
        ]),
      ),
    );
  }
}
