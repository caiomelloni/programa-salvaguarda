import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/view/pages/work_load/components/decorated_input_container.dart';

class InsertWorkloadField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  const InsertWorkloadField({
    Key? key,
    required this.controller,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Total de horas",
          style: TextStyle(color: AppColors.orange, fontSize: 27),
        ),
        const SizedBox(height: 10),
        DecoratedInputContainer(
          height: 60,
          child: Row(
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: 40,
                child: TextField(
                  readOnly: readOnly,
                  keyboardType: TextInputType.number,
                  controller: controller,
                  style: const TextStyle(
                      color: AppColors.lightPurple, fontSize: 25),
                  decoration: const InputDecoration(
                    hintText: "00",
                    border: InputBorder.none,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(2),
                  ],
                  cursorHeight: 30,
                ),
              ),
              const Text(
                "Hrs",
                style: TextStyle(
                  color: AppColors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
