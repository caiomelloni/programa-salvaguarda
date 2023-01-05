import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/pages/edit_adm_profile/edit_adm_profile.dart';
import 'package:projeto_salvaguarda_admin/view/pages/login/login_page.dart';

AppBar getAppBarWidget(
  BuildContext context, {
  bool canPop = false,
  VoidCallback?
      onSignOut, // Ver como é isso --------------------------------------------------------------
  bool showActions = true,
}) {
  return AppBar(
    leading: canPop
        ? IconButton(
            icon: const Icon(Icons.keyboard_backspace),
            onPressed: () => Navigator.pop(context),
          )
        : Image.asset(
            "assets/icone.png",
          ),
    backgroundColor: AppColors.lightPurple,
    actions: showActions
        ? [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                AuthService.service
                    .signOut(); //perguntar como funciona o auth para logout
                onSignOut?.call();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ]
        : [],
  );
}
