import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:projeto_salvaguarda_admin/model/activity.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/buttons/elevated_button_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/safe_area_widget.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/components/big_text_field_description.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/components/workload_field.dart';

class WorkLoadPage extends StatelessWidget {
  final Activity atividade;

  const WorkLoadPage({
    Key? key,
    required this.atividade,
  }) : super(key: key);
  // const WorkLoadPage({super.key});
  //vai receber uma argumento da classe atividade que contenha os atributos de horas, descrição e feedback
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
                  "Atividade ${DateFormat('dd/MM/yyyy').format(atividade.date)}",
                  style: const TextStyle(
                      color: AppColors.lightPurple, fontSize: 30),
                ),
                const SizedBox(height: 8),
                WorkloadField(
                  horasTrabalhadas: atividade.hoursWorked.toString(),
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
