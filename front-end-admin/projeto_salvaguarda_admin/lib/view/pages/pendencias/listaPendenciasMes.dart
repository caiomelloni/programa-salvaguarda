import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  const ListaPendenciasMes({
    super.key,
    required this.users,
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
                          itemCount: users.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                showAlertDialog(
                                    context: context,
                                    title: "bla",
                                    icone1: const Icon(Icons.check),
                                    icone2: const Icon(Icons.check),
                                    body: Text(
                                        users[index].pendencies.toString()),
                                    onPressed1: () {
                                      Navigator.pop(context);
                                    });
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              users[index].name,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      156, 239, 82, 14),
                                                  fontSize: 20),
                                              maxLines: 1,
                                            ),
                                            Text(
                                              users[index].role,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      156, 239, 82, 14),
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
