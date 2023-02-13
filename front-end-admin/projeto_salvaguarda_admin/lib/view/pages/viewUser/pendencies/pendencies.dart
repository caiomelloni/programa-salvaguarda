import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:projeto_salvaguarda_admin/services/enableRegisterPendentWorload/errors/register_pendency.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/pendencies_model.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/pop-up/alert_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/components/safe_area_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/snackbar.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_pendencies/pendency_api_store.dart';

PendecyApiController _pendecyApiController = PendecyApiController();

class ViewPendencies extends StatelessWidget {
  final List<PendenciesModel> listPendencies;

  const ViewPendencies({
    Key? key,
    required this.listPendencies,
  }) : super(key: key);
  static const pageName = "/viewPendencies";

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
                const Text(
                  "O membro possui as sequintes pendências neste ano",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.lightPurple, fontSize: 25),
                ),
                SingleChildScrollView(
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.cinzaClaro,
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 300.0,
                        child: ListView.builder(
                          itemCount: listPendencies.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Observer(
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  if (DateTime.now().year ==
                                      listPendencies[index].dtCreated.year) {
                                    showAlertDialog(
                                      context: context,
                                      title: "Mês pendente",
                                      icone1: const Icon(Icons.close),
                                      icone2: const Icon(Icons.check),
                                      body: const Text(
                                        "O usuário não preencheu a carga horária deste mês. Deseja dar um prazo de mais 3 dias para o preenchimento desse mês a partir de hoje?",
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
                                                        listPendencies[index]
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
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                decoration: const BoxDecoration(
                                                  // color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0)),
                                                ),
                                                child: Text(
                                                  DateFormat('dd/MM/yyyy')
                                                      .format(
                                                          listPendencies[index]
                                                              .dtCreated)
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 17, 0),
                                                      fontSize: 20),
                                                  maxLines: 1,
                                                ),
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
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
