import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/workload_model.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/safe_area_widget.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/components/big_text_field_description.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/components/workload_field.dart';

class WorkLoadPage extends StatelessWidget {
  final WorkloadModel atividade;

  const WorkLoadPage({
    Key? key,
    required this.atividade,
  }) : super(key: key);
  static const pageName = "/viewActivitiesDetails";

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        appBar: getAppBarWidget(
          context,
          canPop: true,
          onSignOut: () => Navigator.of(context).pop(),
        ),
        body: SingleChildScrollView(
          child: PagePaddingWidget(
            extraPadding: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Atividade de ${atividade.month}/${atividade.year}",
                  style: const TextStyle(
                      color: AppColors.lightPurple, fontSize: 30),
                ),
                const SizedBox(height: 8),
                WorkloadField(
                  horasTrabalhadas: atividade.workedHours.toString(),
                ),
                TextFieldDescription(
                  title: "Descrição dos feitos",
                  descricao: atividade.description,
                ),
                TextFieldDescription(
                  title: "Feedback",
                  descricao: atividade.feedback,
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
