import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';

class TabBarWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const TabBarWidget({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        // length: 3,
        length: 1,
        child: SafeArea(
          child: Scaffold(
            // appBar: const AppBarTab(
            //     icone: [Icons.arrow_back, Icons.settings, Icons.logout],
            //     texto: "Pendências no Mês"),
            appBar: getAppBarWidget(context, canPop: true, showActions: true),
            body: SafeArea(child: TabBarView(children: children)),
          ),
        ),
      );
}
