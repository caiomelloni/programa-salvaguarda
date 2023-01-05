import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/view/app/app.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';

void main() async {
  await initApp();

  runApp(const App());
}

Future<void> initApp() async {
  await AuthService.initService();
}
