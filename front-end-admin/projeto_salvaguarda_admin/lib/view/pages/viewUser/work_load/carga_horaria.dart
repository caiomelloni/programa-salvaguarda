import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/buttons/elevated_button_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/safe_area_widget.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/components/big_text_field_description.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/components/workload_field.dart';

class WorkLoadPage extends StatelessWidget {
  const WorkLoadPage({super.key});
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
              children: const [
                SizedBox(height: 20),
                Text(
                  "Atividade dd/mm/yyyy",
                  style: TextStyle(color: AppColors.lightPurple, fontSize: 30),
                ),
                SizedBox(height: 8),
                WorkloadField(
                  horasTrabalhadas: "16",
                ),
                TextFieldDescription(
                  title: "Descrição dos feitos",
                  descricao:
                      "Corrigi 2 redações da Ana Almeida, 3 do Gustavo dos Santos e 3 da Júlia da silva. Forneci feedback construtivos de como poderiam ter feito melhores redações aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                ),
                TextFieldDescription(
                  title: "Feedback",
                  descricao:
                      "Corrigi 2 redações da Ana Almeida, 3 do Gustavo dos Santos e 3 da Júlia da silva. Forneci feedback construtivos de como poderiam ter feito melhores redações aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
