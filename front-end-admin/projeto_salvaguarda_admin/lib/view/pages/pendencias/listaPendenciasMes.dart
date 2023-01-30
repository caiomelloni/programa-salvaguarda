import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_salvaguarda_admin/model/pendency.dart';
import 'package:projeto_salvaguarda_admin/model/user.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/pop-up/alert_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/login/login_page.dart';

class ListaPendenciasMes extends StatelessWidget {
  // late List<ButtonUser> buttonsList;
  final List<User> users;
  final List<Pendency> pendencies;
  final String ano;

  const ListaPendenciasMes({
    super.key,
    required this.pendencies,
    required this.users,
    required this.ano,
  });

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
                          itemCount: pendencies.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                if (int.parse(ano) == DateTime.now().year) {
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
                                    onPressed2: () => {},
                                  ); // Falta aqui *************************************************
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
                                              users
                                                  .where((element) =>
                                                      element.id ==
                                                      pendencies[index].idUser)
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
                                              users
                                                  .where((element) =>
                                                      element.id ==
                                                      pendencies[index].idUser)
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
