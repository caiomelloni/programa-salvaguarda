import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:projeto_salvaguarda_admin/model/activity.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/safe_area_widget.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/carga_horaria.dart';

// List<Carga> arrCarga = [Carga("14/11/2022"), Carga("12/11/2021")];

class ViewActivities extends StatelessWidget {
  final List<Activity> listActivities;

  const ViewActivities({
    Key? key,
    required this.listActivities,
  }) : super(key: key);
  // const ViewActivities({super.key});
  //vai receber uma lista de atividades
  static const pageName = "/viewActivities";

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
                  "O membro registrou as seguintes atividades",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.lightPurple, fontSize: 25),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.cinzaClaro,
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 350.0,
                        child: ListView.builder(
                          itemCount: listActivities.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WorkLoadPage(
                                            atividade: listActivities[index],
                                          )),
                                );
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
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0)),
                                              ),
                                              child: Text(
                                                DateFormat('dd/MM/yyyy')
                                                    .format(
                                                        listActivities[index]
                                                            .date)
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        156, 239, 82, 14),
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

// class Carga {
//   String data;
//   Carga(this.data);
// }
