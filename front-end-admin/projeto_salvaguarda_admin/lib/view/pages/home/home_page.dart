import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/safe_area_widget.dart';
import 'package:projeto_salvaguarda_admin/view/pages/edit_adm_profile/edit_adm_profile.dart';
import 'package:projeto_salvaguarda_admin/view/pages/home/components/home_big_button.dart';
import 'package:projeto_salvaguarda_admin/view/pages/login/login_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/pendencias/listaPendenciasMes.dart';
import 'package:projeto_salvaguarda_admin/view/pages/pendencias/tabelaPendenciasMeses.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/sortable_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/tabbar_widget.dart';

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
                      HomeBigButton(
                        icone: Icons.groups,
                        texto: "Acessar lista de colaboradores",
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TabBarWidget(
                              title: "Tabela Users",
                              children: [
                                SortablePage(),
                                Container(),
                                Container()
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      HomeBigButton(
                          icone: Icons.announcement,
                          texto: "Acessar pendências",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TabelaPendenciasMeses()));
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
