// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/errors/enable_certiificate_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/errors/users_api_errors.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/safe_area_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/snackbar.dart';
import 'package:projeto_salvaguarda_admin/view/pages/home/components/home_big_button.dart';
import 'package:projeto_salvaguarda_admin/view/pages/pendencias/tabelaPendenciasMeses.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/sortable_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_enable_certificate/enable_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_users/users_api_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/enable_all_certificate_tutor_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/tabbar_widget.dart';

UserApiController _userApiController1 = UserApiController();
UserApiController _userApiController2 = UserApiController();
EnableCertificateController _enableCertificateController =
    EnableCertificateController();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const pageName = "/home";

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        appBar: getAppBarWidget(context, canPop: false, showActions: true),
        body: SingleChildScrollView(
          child: PagePaddingWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Boas Vindas, ${AuthService.instance.currentUser!.name}!",
                  style: const TextStyle(
                      color: AppColors.lightPurple, fontSize: 30),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Observer(
                        builder: (context) => HomeBigButton(
                          icone: Icons.groups,
                          texto: "Acessar lista de colaboradores",
                          isLoading: _userApiController1.isLoading,
                          onPressed: _userApiController1.isLoading
                              ? () {}
                              : () async {
                                  try {
                                    var users = await _userApiController1
                                        .tryFetchUsers()
                                        .then(
                                      (value) {
                                        if (value != null) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TabBarWidget(
                                                title: "Tabela Users",
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  SortablePage(
                                                    usersFiltered: value,
                                                    allUser: value,
                                                  ),
                                                  // Container(),
                                                  // Container()
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          throw NullUsersValue();
                                        }
                                      },
                                    );
                                  } on UserApiErrors catch (e) {
                                    showSnackBar(context, e.message());
                                  }
                                },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Observer(
                        builder: (context) => HomeBigButton(
                          icone: Icons.announcement,
                          texto: "Acessar pendências",
                          isLoading: _userApiController2.isLoading,
                          onPressed: _userApiController2.isLoading
                              ? () {}
                              : () async {
                                  try {
                                    await _userApiController2
                                        .tryFetchUsers()
                                        .then(
                                      (value) {
                                        if (value != null) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TabelaPendenciasMeses(
                                                usersFiltered: value,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  } on UserApiErrors catch (e) {
                                    showSnackBar(context, e.message());
                                  }
                                },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Observer(
                        builder: (context) => HomeBigButton(
                          icone: Icons.playlist_add_check,
                          texto: "Habilitar Todos os Certificados",
                          isLoading: _enableCertificateController.isLoading,
                          onPressed: _enableCertificateController.isLoading
                              ? () {}
                              : () async {
                                  try {
                                    enableAllCertificateUsuario(
                                        context, _enableCertificateController);
                                  } on CantEnableAllException catch (e) {
                                    showSnackBar(context, e.message());
                                  }
                                },
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
  }
}
