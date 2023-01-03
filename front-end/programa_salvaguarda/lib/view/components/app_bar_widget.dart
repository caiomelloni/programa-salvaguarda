import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/services/auth/service/auth_service.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/view/pages/edit_profile/edit_profile_page.dart';

AppBar getAppBarWidget(
  BuildContext context, {
  bool canPop = false,
  VoidCallback? onSignOut,
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
                Navigator.of(context).pushNamed(EditProfilePage.pageName);
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                AuthService.service.signOut();
                onSignOut?.call();
              },
            ),
          ]
        : [],
  );
}
