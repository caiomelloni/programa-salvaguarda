import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/view/pages/home/home_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/login/login_page.dart';
import 'package:projeto_salvaguarda_admin/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Salvaguardas',
      debugShowCheckedModeBanner: false,
      home:
          AuthService.instance.isLogged ? const HomePage() : const LoginPage(),
      theme: appTheme(),
    );
  }
}
