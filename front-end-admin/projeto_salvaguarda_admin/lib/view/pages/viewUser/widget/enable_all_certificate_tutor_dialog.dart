import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/errors/enable_certiificate_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/view/components/pop-up/alert_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_enable_certificate/enable_store.dart';

void enableAllCertificateUsuario(
    BuildContext context, EnableCertificateController _controller) {
  showAlertDialog(
    context: context,
    title:
        "Você tem certeza que deseja habilitar o certificado para TODOS os usuários?",
    icone1: const Icon(Icons.close),
    icone2: const Icon(Icons.check),
    body: const Text(
      "Esta ação irá liberar a requisição do certificado de participação do programa para TODOS os usuários. Está é uma ação permanente, tenha certeza antes de confirmar",
      textAlign: TextAlign.center,
    ),
    twoicons: true,
    onPressed1: () => Navigator.pop(context),
    onPressed2: () async {
      Navigator.pop(context);

      try {
        await _controller.tryEnableAllCertificateUser();
        showAlertDialog(
          context: context,
          title: "Certificados habilitados!",
          body: const Text(
            "TODOS os usuário estão habilitados para requisitar o certificado de participação no programa SalvaGuarda",
            textAlign: TextAlign.center,
          ),
          icone1: const Icon(Icons.check),
          icone2: const Icon(Icons.check),
          onPressed1: () => Navigator.pop(context),
        );
      } on CantEnableException catch (e) {
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
