import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/services/workload/service/workload_service.dart';
import 'package:programa_salvaguarda/view/components/app_bar_widget.dart';
import 'package:programa_salvaguarda/view/components/page_padding_widget.dart';
import 'package:programa_salvaguarda/view/components/safe_area_widget.dart';
import 'package:programa_salvaguarda/view/pages/my_registers/components/register_button.dart';

import '../../../theme/app_colors.dart';

class MyRegistersPage extends StatelessWidget {
  const MyRegistersPage({super.key});

  static const pageName = "/myRegisters";

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        appBar: getAppBarWidget(context, canPop: true, showActions: false),
        body: SingleChildScrollView(
          child: PagePaddingWidget(
            extraPadding: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20, width: double.infinity),
                const Text(
                  "Meus Registros",
                  style: TextStyle(color: AppColors.orange, fontSize: 30),
                ),
                const SizedBox(height: 20),
                FutureBuilder<List<Widget>>(
                  future: getWorkloadButtons(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(children: snapshot.data ?? []);
                    }

                    return const CircularProgressIndicator();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<Widget>> getWorkloadButtons() async {
  List<Widget> btns = [];

  btns = (await WorkLoadService.service.getAllWorkloads())
      .map((workloadModel) => RegisterButton(workload: workloadModel))
      .toList();

  return btns;
}
