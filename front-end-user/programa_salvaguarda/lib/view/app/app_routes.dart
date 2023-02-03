import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/view/pages/edit_profile/edit_profile_page.dart';
import 'package:programa_salvaguarda/view/pages/home/home_page.dart';
import 'package:programa_salvaguarda/view/pages/work_load/work_load_page.dart';

final Map<String, Widget Function(BuildContext)> kRoutes = {
  HomePage.pageName: (context) => const HomePage(),
  EditProfilePage.pageName: (context) => const EditProfilePage(),
  WorkLoadPage.pageName: (context) => const WorkLoadPage(),
};
