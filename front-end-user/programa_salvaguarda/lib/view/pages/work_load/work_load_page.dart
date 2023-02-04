import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:programa_salvaguarda/services/workload/errors/workload_exceptions.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/view/components/app_bar_widget.dart';
import 'package:programa_salvaguarda/view/components/buttons/elevated_button_widget.dart';
import 'package:programa_salvaguarda/view/components/page_padding_widget.dart';
import 'package:programa_salvaguarda/view/components/pop_up/alert_dialog.dart';
import 'package:programa_salvaguarda/view/components/safe_area_widget.dart';
import 'package:programa_salvaguarda/view/pages/work_load/components/big_text_field_with_tilte.dart';
import 'package:programa_salvaguarda/view/pages/work_load/components/insert_workload_field.dart';
import 'package:programa_salvaguarda/view/pages/work_load/store/workload_store.dart';

class WorkLoadPage extends StatelessWidget {
  const WorkLoadPage({super.key});
  static const pageName = "/workLoad";

  @override
  Widget build(BuildContext context) {
    final WorkLoadController controller = WorkLoadController();
    return SafeAreaWidget(
      child: Scaffold(
        appBar: getAppBarWidget(context, canPop: true, showActions: false),
        body: FutureBuilder(
            future: controller.fetchLastWorkload(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: PagePaddingWidget(
                        extraPadding: const EdgeInsets.only(bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              "Controle de carga horária",
                              style: TextStyle(
                                  color: AppColors.lightPurple, fontSize: 30),
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
                                    text: " ${controller.currentMonth()}",
                                    style: const TextStyle(
                                        color: AppColors.orange),
                                  )
                                ],
                              ),
                            ),
                            InsertWorkloadField(
                                controller: controller.cargaHorariaController),
                            BigTextFieldWithTitleWidget(
                              title: "Descrição dos feitos",
                              hintText:
                                  "Descreva o trabalho realizado no programa neste mês",
                              controller: controller.descricaoFeitosController,
                            ),
                            BigTextFieldWithTitleWidget(
                              title: "Feedback",
                              hintText:
                                  "o feedback não é obrigatório, use esse campo para expor sua relação com os alunos e com o programa nesse mês",
                              controller: controller.feedbackController,
                            ),
                            const SizedBox(height: 20),
                            Observer(
                              builder: (context) => ElevatedButtonWidget(
                                isLoading: controller.isLoading,
                                title: 'Salvar',
                                icon: Icons.check_circle,
                                onPressed: controller.isLoading
                                    ? () {}
                                    : () => submitWorkLoad(context, controller),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}

void submitWorkLoad(BuildContext context, WorkLoadController controller) {
  showAlertDialog(
    context: context,
    title: "Deseja inserir a carga?",
    buttonText: "Enviar",
    cancelButton: true,
    body: const Text(
      "Ao inserir um nova carga, você irá sobrescrever o último registro que foi realizado neste mês",
    ),
    onPressed: () async {
      Navigator.pop(context);

      try {
        await controller.submitWorkLoad();
        showAlertDialog(
            context: context,
            title: "Carga inserida",
            buttonText: "Ok",
            body: const Text(
              "Obrigado!, a carga horária desse mês foi inserida com sucesso",
            ),
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName("/")));
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
