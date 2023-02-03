import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/view/app/app_routes.dart';
import 'package:programa_salvaguarda/view/components/auth_listenable_widget.dart';
import 'package:programa_salvaguarda/view/pages/home/home_page.dart';
import 'package:programa_salvaguarda/view/pages/login/login_page.dart';
import 'package:programa_salvaguarda/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Salvaguardas',
      debugShowCheckedModeBanner: false,
      home: AuthListenableWidget(
        builder: (context, user) {
          return user != null ? const HomePage() : const LoginPage();
        },
      ),
      theme: appTheme(),
      routes: kRoutes,
    );
  }
}