import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/view/pages/edit_adm_profile/edit_adm_profile.dart';
import 'package:projeto_salvaguarda_admin/view/pages/home/home_page.dart';

final Map<String, Widget Function(BuildContext)> kRoutes = {
  HomePage.pageName: (context) => const HomePage(),
  EditProfilePage.pageName: (context) => const EditProfilePage(),
};
