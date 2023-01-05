import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/components/big_textfield.dart';

class TextFieldDescription extends StatelessWidget {
  final String title;
  final String descricao;
  const TextFieldDescription({
    Key? key,
    required this.title,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(color: AppColors.orange, fontSize: 27),
        ),
        const SizedBox(width: 5),
        BigTextFieldWidget(
          descricao: descricao,
        )
      ],
    );
  }
}
