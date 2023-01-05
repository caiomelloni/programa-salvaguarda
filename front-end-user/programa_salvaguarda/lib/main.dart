import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/services/workload/service/workload_service.dart';
import 'package:programa_salvaguarda/view/app/app.dart';
import 'package:programa_salvaguarda/services/auth/service/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(const App());
}

Future<void> initApp() async {
  await AuthService.initService();
  WorkLoadService.initWorkloadService();
}
