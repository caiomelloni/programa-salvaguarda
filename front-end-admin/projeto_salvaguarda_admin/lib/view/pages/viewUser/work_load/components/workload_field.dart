import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/components/decorated_input_container.dart';

class WorkloadField extends StatelessWidget {
  final String horasTrabalhadas;
  const WorkloadField({
    Key? key,
    required this.horasTrabalhadas,
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
                child: Text(
                  horasTrabalhadas,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "Hrs",
                style: TextStyle(
                  color: AppColors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
