import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:programa_salvaguarda/services/workload/errors/workload_exceptions.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/view/components/app_bar_widget.dart';
import 'package:programa_salvaguarda/view/components/buttons/elevated_button_widget.dart';
import 'package:programa_salvaguarda/view/components/page_padding_widget.dart';
import 'package:programa_salvaguarda/view/components/pop_up/alert_dialog.dart';
import 'package:programa_salvaguarda/view/components/safe_area_widget.dart';
import 'package:programa_salvaguarda/view/pages/home/home_page.dart';
import 'package:programa_salvaguarda/view/pages/work_load/components/big_text_field_with_tilte.dart';
import 'package:programa_salvaguarda/view/pages/work_load/components/insert_workload_field.dart';
import 'package:programa_salvaguarda/view/pages/work_load/store/workload_store.dart';

WorkLoadController _controller = WorkLoadController();

class WorkLoadPage extends StatelessWidget {
  const WorkLoadPage({super.key});
  static const pageName = "/workLoad";

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
                  "Controle de carga horária",
                  style: TextStyle(color: AppColors.lightPurple, fontSize: 30),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        color: AppColors.lightPurple, fontSize: 25),
                    children: [
                      const TextSpan(
                        text:
                            "Insira as informações a respeito do trabalho realizado no mês de",
                      ),
                      TextSpan(
                        text: " ${_controller.currentMonth()}",
                        style: const TextStyle(color: AppColors.orange),
                      )
                    ],
                  ),
                ),
                InsertWorkloadField(
                    controller: _controller.cargaHorariaController),
                BigTextFieldWithTitleWidget(
                  title: "Descrição dos feitos",
                  hintText:
                      "Descreva o trabalho realizado no projeto neste mês",
                  controller: _controller.descricaoFeitosController,
                ),
                BigTextFieldWithTitleWidget(
                  title: "Feedback",
                  hintText:
                      "o feedback não é obrigatório, use esse campo para expor sua relação com os alunos e com o projeto nesse mês",
                  controller: _controller.feedbackController,
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (context) => ElevatedButtonWidget(
                    isLoading: _controller.isLoading,
                    title: 'Enviar',
                    icon: Icons.check_circle,
                    onPressed: _controller.isLoading
                        ? () {}
                        : () => submitWorkLoad(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void submitWorkLoad(BuildContext context) {
  showAlertDialog(
    context: context,
    title: "Deseja inserir a carga?",
    buttonText: "Enviar",
    body: const Text(
      "Ao inserir um nova carga, você irá sobrescrever o último registro que foi realizado neste mês",
    ),
    onPressed: () async {
      Navigator.pop(context);

      try {
        await _controller.submitWorkLoad();
        showAlertDialog(
          context: context,
          title: "Carga inserida",
          buttonText: "Ok",
          body: const Text(
            "Obrigado!, a carga horária desse mês foi inserida com sucesso",
          ),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, HomePage.pageName, (route) => false),
        );
      } on WorkLoadException catch (e) {
        showAlertDialog(
            context: context,
            title: e.errorTitle(),
            buttonText: "Fechar",
            body: Text(
              e.message(),
            ),
            onPressed: () => Navigator.pop(context));
      }
    },
  );
}
