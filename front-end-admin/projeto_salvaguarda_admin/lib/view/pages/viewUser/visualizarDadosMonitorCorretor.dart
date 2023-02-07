import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_salvaguarda_admin/model/activity.dart';
import 'package:projeto_salvaguarda_admin/model/pendency.dart';
import 'package:projeto_salvaguarda_admin/services/banUser/errors/ban_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/errors/pendencies_api_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/pendencies_model.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/requests/pendencies_http_requests.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/get_workload_admin_permission.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/model/user.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/pop-up/alert_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/components/snackbar.dart';
import 'package:projeto_salvaguarda_admin/view/pages/home/home_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/components/buttonDataUser.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/components/dataUser.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_ban/ban_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_disable/disable_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_pendencies/pendency_api_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/ban_usuario_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/disable_usuario_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/atividades.dart';

BanUserController _bancontroller = BanUserController();
DisableUserController _disablecontroller = DisableUserController();
PendecyApiController _pendecyApiController = PendecyApiController();

class VisualizarDadosMoniCorret extends StatefulWidget {
  final SalvaGuardaVolunteers user;
  const VisualizarDadosMoniCorret({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<VisualizarDadosMoniCorret> createState() =>
      _VisualizarDadosMoniCorretState();
}

class _VisualizarDadosMoniCorretState extends State<VisualizarDadosMoniCorret> {
  List<PendenciesModel> _allPendenciesUser = [];
  List<WorkloadModel> _allWorkloadUser = [];
  int lengthPendenciesUser = 0;
  @override
  void initState() {
    super.initState();

    PendencyHttpRequests.fetchOneUserPendenciesModel(
        jsonEncode({'pendencies_id_user': widget.user.id})).then((value) {
      // _allPendenciesUser = value;
      lengthPendenciesUser = value.length;
      setState(() {});
    });
    fetchUserWorkloadModel(widget.user.id.toString()).then((value) {
      _allWorkloadUser = value;
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
                DataUser(info: "$lengthPendenciesUser pendência(s) neste ano"),
                const SizedBox(
                  height: 40,
                ),
                Observer(
                  builder: (context) => ButtonDataUser(
                    icone: Icons.volunteer_activism,
                    texto: "visualizar atividades",
                    isLoading: _pendecyApiController.isLoading,
                    onPressed: _pendecyApiController.isLoading
                        ? () {}
                        : () async {
                            try {
                              var pendencies = await _pendecyApiController
                                  .tryFetchOnePendency(jsonEncode(
                                      {'pendencies_id_user': widget.user.id}))
                                  .then(
                                (value) {
                                  value ??= [];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewActivities(
                                        listActivities: _allWorkloadUser,
                                        listPendencies: value!,
                                      ),
                                    ),
                                  );
                                },
                              );
                            } on CantFetchPendenciesException catch (e) {
                              showSnackBar(context, e.message());
                            }
                          },
                  ),
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
                        : () => disableUsuario(
                            context, _disablecontroller, widget.user),
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
