import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/services/workload/models/workload_model.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/util/functions/month_num_to_string.dart';
import 'package:programa_salvaguarda/view/pages/work_load/non_editable_workload_page.dart';

class RegisterButton extends StatelessWidget {
  final WorkloadModel workload;
  const RegisterButton({super.key, required this.workload});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NonEditableWorkLoadPage(workload: workload),
        ));
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 2.0, color: AppColors.lightPurple),
      ),
      child: Text(
        "${numMonthToString(workload.month)} - ${workload.year} ",
        style: const TextStyle(color: AppColors.lightPurple, fontSize: 30),
      ),
    );
  }
}
