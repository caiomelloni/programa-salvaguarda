import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/services/workload/models/workload_model.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/util/functions/month_num_to_string.dart';
import 'package:programa_salvaguarda/view/components/app_bar_widget.dart';
import 'package:programa_salvaguarda/view/components/page_padding_widget.dart';
import 'package:programa_salvaguarda/view/components/safe_area_widget.dart';
import 'package:programa_salvaguarda/view/pages/work_load/components/big_text_field_with_tilte.dart';
import 'package:programa_salvaguarda/view/pages/work_load/components/insert_workload_field.dart';

class NonEditableWorkLoadPage extends StatelessWidget {
  final WorkloadModel workload;
  const NonEditableWorkLoadPage({super.key, required this.workload});

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        appBar: getAppBarWidget(context, canPop: true, showActions: false),
        body: SingleChildScrollView(
          child: PagePaddingWidget(
            extraPadding: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Carga horária",
                  style: TextStyle(color: AppColors.lightPurple, fontSize: 30),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        color: AppColors.lightPurple, fontSize: 25),
                    children: [
                      const TextSpan(
                        text: "Registro realizado no mês de ",
                      ),
                      TextSpan(
                        text: numMonthToString(workload.month),
                        style: const TextStyle(color: AppColors.orange),
                      )
                    ],
                  ),
                ),
                InsertWorkloadField(
                  controller: TextEditingController()
                    ..text = workload.workedHours.toString(),
                  readOnly: true,
                ),
                BigTextFieldWithTitleWidget(
                  title: "Descrição dos feitos",
                  controller: TextEditingController()
                    ..text = workload.description,
                  readOnly: true,
                ),
                BigTextFieldWithTitleWidget(
                  title: "Feedback",
                  controller: TextEditingController()..text = workload.feedback,
                  readOnly: true,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
