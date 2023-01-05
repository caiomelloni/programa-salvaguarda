import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_salvaguarda_admin/model/user.dart';
import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/getUsersFromAPI.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/components/buttonDataUser.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/components/dataUser.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_ban/ban_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_disable/disable_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_enable_certificate/enable_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/ban_usuario_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/disable_usuario_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/enable_certificate_tutor_dialog.dart';

BanUserController _bancontroller = BanUserController();
DisableUserController _disablecontroller = DisableUserController();
EnableCertificateController _enableCertificateController =
    EnableCertificateController();

class VisualizarDadosTutor extends StatelessWidget {
  final SalvaGuardaVolunteers user;

  const VisualizarDadosTutor({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidget(context, canPop: true, showActions: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: user.name),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: user.email),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: user.cellphone),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: user.course),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: user.university),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: user.role),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: "${user.hoursWorked} Horas cumpridas"),
                const SizedBox(
                  height: 40,
                ),
                Observer(
                  builder: (context) => ButtonDataUser(
                    icone: Icons.done_all,
                    texto: "Habilitar Certificado",
                    isLoading: _enableCertificateController.isLoading,
                    onPressed: _enableCertificateController.isLoading
                        ? () {}
                        : () => enableCertificateUsuario(
                            context, _enableCertificateController),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonDataUser(
                  icone: Icons.volunteer_activism,
                  texto: "visualizar atividades",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (context) => ButtonDataUser(
                    icone: Icons.no_accounts,
                    texto: "Desativar",
                    isLoading: _disablecontroller.isLoading,
                    onPressed: _disablecontroller.isLoading
                        ? () {}
                        : () => disableUsuario(context, _disablecontroller),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (context) => ButtonDataUser(
                    icone: Icons.delete,
                    texto: "Banir",
                    isLoading: _bancontroller.isLoading,
                    onPressed: _bancontroller.isLoading
                        ? () {}
                        : () => banUsuario(context, _bancontroller),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
