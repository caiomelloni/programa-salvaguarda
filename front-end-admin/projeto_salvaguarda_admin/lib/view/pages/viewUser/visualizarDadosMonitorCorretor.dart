import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_salvaguarda_admin/model/activity.dart';
import 'package:projeto_salvaguarda_admin/model/pendency.dart';
import 'package:projeto_salvaguarda_admin/services/banUser/errors/ban_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/get_pendencies_from_api.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/getUsersFromAPI.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/model/user.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/pop-up/alert_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/home/home_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/components/buttonDataUser.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/components/dataUser.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_ban/ban_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_disable/disable_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/ban_usuario_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/disable_usuario_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/atividades.dart';

BanUserController _bancontroller = BanUserController();
DisableUserController _disablecontroller = DisableUserController();

class VisualizarDadosMoniCorret extends StatefulWidget {
  // final SalvaGuardaVolunteers user;
  final SalvaGuardaVolunteers user;
  // final List<PendenciesModel> userPendency;
  final List<Activity> userActivity;

  const VisualizarDadosMoniCorret({
    Key? key,
    required this.user,
    // required this.userPendency,
    required this.userActivity,
  }) : super(key: key);

  @override
  State<VisualizarDadosMoniCorret> createState() =>
      _VisualizarDadosMoniCorretState();
}

class _VisualizarDadosMoniCorretState extends State<VisualizarDadosMoniCorret> {
  List<PendenciesModel> _allPendenciesUser = [];
  @override
  void initState() {
    super.initState();

    // fetchPendenciesModel().then((value) {
    //   _allPendenciesUser =
    //       value.where((e) => e.pendenciesIdUser == widget.user.id).toList();
    //   setState(() {});
    // });
    fetchOneUserPendenciesModel(
        jsonEncode({'pendencies_id_user': widget.user.id})).then((value) {
      _allPendenciesUser = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    int year = DateTime.now().year;
    return SafeArea(
      child: Scaffold(
        // appBar: const AppBarViewUserData(),
        appBar: getAppBarWidget(context, canPop: true, showActions: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: widget.user.name),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: widget.user.email),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: widget.user.cellphone),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: widget.user.course),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: widget.user.university),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: widget.user.role),
                const SizedBox(
                  height: 20,
                ),
                DataUser(info: "${widget.user.hoursWorked} Horas cumpridas"),
                const SizedBox(
                  height: 20,
                ),
                DataUser(
                    info:
                        "${_allPendenciesUser.where((element) => element.dtCreated.year == year).toList().length} pendência(s) neste ano"),
                const SizedBox(
                  height: 40,
                ),
                ButtonDataUser(
                  icone: Icons.volunteer_activism,
                  texto: "visualizar atividades",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewActivities(
                                  listActivities: widget.userActivity,
                                  listPendencies: _allPendenciesUser,
                                )));
                  },
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
                        : () =>
                            banUsuario(context, _bancontroller, widget.user),
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
