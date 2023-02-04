import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/view/components/app_bar_widget.dart';
import 'package:programa_salvaguarda/view/components/auth_listenable_widget.dart';
import 'package:programa_salvaguarda/view/components/page_padding_widget.dart';
import 'package:programa_salvaguarda/view/components/safe_area_widget.dart';
import 'package:programa_salvaguarda/view/pages/home/components/home_big_button.dart';
import 'package:programa_salvaguarda/view/pages/home/components/scrollable_row.dart';
import 'package:programa_salvaguarda/view/pages/my_registers/my_registers_page.dart';
import 'package:programa_salvaguarda/view/pages/work_load/work_load_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const pageName = "/home";

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        appBar: getAppBarWidget(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              PagePaddingWidget(
                child: AuthListenableWidget(
                  builder: (_, user) => Text(
                    "Boas Vindas, ${user?.name}!",
                    style: const TextStyle(
                        color: AppColors.lightPurple, fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ScrollableRow(
                children: [
                  HomeBigButton(
                    icone: Icons.calendar_month,
                    texto: "inserir carga horária",
                    onPressed: () =>
                        Navigator.of(context).pushNamed(WorkLoadPage.pageName),
                  ),
                  const SizedBox(width: 20),
                  HomeBigButton(
                      icone: Icons.menu_book_rounded,
                      texto: "meus registros",
                      onPressed: () => Navigator.of(context)
                          .pushNamed(MyRegistersPage.pageName)),
                ],
              ),
              ScrollableRow(
                children: [
                  HomeBigButton(
                      icone: Icons.fact_check,
                      texto: "emissão de atestado",
                      onPressed: () {}),
                  const SizedBox(width: 20),
                  HomeBigButton(
                      icone: Icons.workspace_premium,
                      texto: "emissão de certificado",
                      onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
