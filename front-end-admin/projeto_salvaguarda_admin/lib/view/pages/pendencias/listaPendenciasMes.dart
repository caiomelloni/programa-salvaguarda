import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_salvaguarda_admin/services/enableRegisterPendentWorload/errors/register_pendency.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/pendencies_model.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/pop-up/alert_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/components/snackbar.dart';
import '../viewUser/store_pendencies/pendency_api_store.dart';

PendecyApiController _pendecyApiController = PendecyApiController();

class ListaPendenciasMes extends StatefulWidget {
  final List<SalvaGuardaVolunteers> users;
  final String ano;
  final List<PendenciesModel> pendencies;

  const ListaPendenciasMes({
    super.key,
    required this.users,
    required this.ano,
    required this.pendencies,
  });

  @override
  State<ListaPendenciasMes> createState() => _ListaPendenciasMesState();
}

class _ListaPendenciasMesState extends State<ListaPendenciasMes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidget(context, canPop: true, showActions: true),
        body: SingleChildScrollView(
          child: PagePaddingWidget(
            extraPadding: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                SingleChildScrollView(
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.cinzaClaro,
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 350.0,
                        child: ListView.builder(
                          itemCount: widget.pendencies.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Observer(
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  if (int.parse(widget.ano) ==
                                      DateTime.now().year) {
                                    showAlertDialog(
                                      context: context,
                                      title: "Mês pendente",
                                      icone1: const Icon(Icons.close),
                                      icone2: const Icon(Icons.check),
                                      body: const Text(
                                        "O usuário não preencheu a carga horária deste mês. Deseja habilitar o preenchimento do mês pendente?",
                                        textAlign: TextAlign.center,
                                      ),
                                      twoicons: true,
                                      onPressed1: () => Navigator.pop(context),
                                      onPressed2: _pendecyApiController
                                              .isLoading
                                          ? () {}
                                          : () async {
                                              Navigator.pop(context);
                                              try {
                                                await _pendecyApiController
                                                    .tryUpdateRegisterPendency(
                                                        widget.pendencies[index]
                                                            .id);
                                                showAlertDialog(
                                                  context: context,
                                                  title: "Usuário Habilitado!",
                                                  body: const Text(
                                                    "O usuário está habilitado para registrar a pendência!",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  icone1:
                                                      const Icon(Icons.check),
                                                  icone2:
                                                      const Icon(Icons.check),
                                                  onPressed1: () =>
                                                      Navigator.pop(context),
                                                );
                                              } on CantEnableRegisterPendencyException catch (e) {
                                                showSnackBar(
                                                    context, e.message());
                                              }
                                            },
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          181, 157, 116, 179),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          // color: Colors.deepOrange,
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              bottom: 10.0,
                                              top: 5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                // users[index].name,
                                                widget.users
                                                    .where((element) =>
                                                        element.id ==
                                                        widget.pendencies[index]
                                                            .pendenciesIdUser)
                                                    .toList()
                                                    .first
                                                    .name
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 17, 0),
                                                    fontSize: 20),
                                                maxLines: 1,
                                              ),
                                              Text(
                                                // users[index].role,
                                                widget.users
                                                    .where((element) =>
                                                        element.id ==
                                                        widget.pendencies[index]
                                                            .pendenciesIdUser)
                                                    .toList()
                                                    .first
                                                    .role
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 17, 0),
                                                    fontSize: 20),
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
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
