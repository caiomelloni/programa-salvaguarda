import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/services/banUser/errors/ban_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/getUsersFromAPI.dart';
import 'package:projeto_salvaguarda_admin/view/components/pop-up/alert_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/home/home_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_ban/ban_store.dart';

void banUsuario(BuildContext context, BanUserController _controller,
    SalvaGuardaVolunteers user) {
  showAlertDialog(
    context: context,
    title: "Você tem certeza que deseja banir este usuário?",
    icone1: const Icon(Icons.close),
    icone2: const Icon(Icons.check),
    body: const Text(
      "Está é uma ação permanente. Tenha certeza antes de confirmar",
      textAlign: TextAlign.center,
    ),
    twoicons: true,
    onPressed1: () => Navigator.pop(context),
    onPressed2: () async {
      Navigator.pop(context);

      try {
        await _controller.tryBanUser(user);
        showAlertDialog(
          context: context,
          title: "Usuário banido!",
          body: const Text(
            "O usuário foi banido com sucesso",
            textAlign: TextAlign.center,
          ),
          icone1: const Icon(Icons.check),
          icone2: const Icon(Icons.check),
          onPressed1: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage())),
        );
      } on CantBanUser catch (e) {
        showAlertDialog(
            context: context,
            title: e.errorTitle(),
            body: Text(
              e.message(),
              textAlign: TextAlign.center,
            ),
            icone1: const Icon(Icons.check),
            icone2: const Icon(Icons.check),
            onPressed1: () => Navigator.pop(context));
      }
    },
  );
}
