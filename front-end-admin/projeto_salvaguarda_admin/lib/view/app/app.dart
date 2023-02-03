import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_theme.dart';
import 'package:projeto_salvaguarda_admin/view/app/app_routes.dart';
import 'package:projeto_salvaguarda_admin/view/components/auth_listenable_widget.dart';
import 'package:projeto_salvaguarda_admin/view/pages/home/home_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/login/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Salvaguardas',
      debugShowCheckedModeBanner: false,
      home: AuthListenableWidget(
        builder: (context, user, child) {
          return user != null ? const HomePage() : const LoginPage();
        },
      ),
      theme: appTheme(),
      routes: kRoutes,
    );
  }
}
