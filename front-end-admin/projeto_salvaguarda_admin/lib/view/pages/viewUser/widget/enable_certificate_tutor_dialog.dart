import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/errors/enable_errors.dart';
import 'package:projeto_salvaguarda_admin/view/components/pop-up/alert_dialog.dart';
import 'package:projeto_salvaguarda_admin/view/pages/home/home_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/store_enable_certificate/enable_store.dart';

void enableCertificateUsuario(
    BuildContext context, EnableCertificateController _controller) {
  showAlertDialog(
    context: context,
    title:
        "Você tem certeza que deseja habilitar o certificado para este usuário?",
    icone1: const Icon(Icons.close),
    icone2: const Icon(Icons.check),
    body: const Text(
      "Esta ação irá liberar a requisição do certificado de participação do projeto para este usuário",
      textAlign: TextAlign.center,
    ),
    twoicons: true,
    onPressed1: () => Navigator.pop(context),
    onPressed2: () async {
      Navigator.pop(context);

      try {
        await _controller.tryEnableCertificateUser();
        showAlertDialog(
          context: context,
          title: "Usuário habilitado!",
          body: const Text(
            "O usuário está habilitado a requisitar o certificado de participação no projeto SalvaGuarda",
            textAlign: TextAlign.center,
          ),
          icone1: const Icon(Icons.check),
          icone2: const Icon(Icons.check),
          // onPressed1: () => Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => HomePage())),
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
