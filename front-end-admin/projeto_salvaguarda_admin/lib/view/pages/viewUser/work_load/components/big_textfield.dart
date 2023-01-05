import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/components/decorated_input_container.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/work_load/carga_horaria.dart';

class BigTextFieldWidget extends StatelessWidget {
  final String descricao;

  const BigTextFieldWidget({
    Key? key,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: DecoratedInputContainer(
        height: 200,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              descricao,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
