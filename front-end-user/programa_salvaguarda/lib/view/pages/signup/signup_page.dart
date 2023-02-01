import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:programa_salvaguarda/services/auth/errors/auth_exceptions.dart';
import 'package:programa_salvaguarda/view/components/buttons/elevated_button_widget.dart';
import 'package:programa_salvaguarda/view/components/page_padding_widget.dart';
import 'package:programa_salvaguarda/view/components/safe_area_widget.dart';
import 'package:programa_salvaguarda/view/components/snackbar.dart';
import 'package:programa_salvaguarda/view/pages/signup/components/dropdown_widget.dart';
import 'package:programa_salvaguarda/view/pages/signup/components/signup_textfield.dart';
import 'package:programa_salvaguarda/view/pages/signup/store/signup_store.dart';
import 'package:programa_salvaguarda/view/pages/signup/utils/card_formater.dart';
import 'package:programa_salvaguarda/view/pages/signup/utils/cursos.dart';
import 'package:programa_salvaguarda/view/pages/signup/utils/universidades.dart';

final _controller = SignUpController();

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const pageName = "/signUp";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: PagePaddingWidget(
            extraPadding: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Cadastre-se",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Divider(color: Colors.black, thickness: 1.5),
                const Text(
                  "Dados Pessoais",
                  style: TextStyle(fontSize: 15),
                ),
                SignUpTextField(
                  label: "Nome",
                  onChanged: (value) => _controller.setNome(value),
                ),
                SignUpTextField(
                  label: "Sobrenome",
                  onChanged: (value) => _controller.setSobrenome(value),
                ),
                SignUpTextField(
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => _controller.setEmail(value),
                ),
                SignUpTextField(
                  label: "Telefone",
                  onChanged: (value) => _controller.setTelefone(value),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp('[, .]'),
                            ),
                            CardFormatter(
                              sample: '(xx)xxxxx-xxxx',
                              separator: ['(', ')', '-'],
                            )
                          ],

                ),
                Observer(
                  builder: (_) => DropDownWidget(
                    label: _controller.universidade ?? "Universidade",
                    searchHintText: "Pesquise a Universidade",
                    options: kUniversidades,
                    onSelected: (value) => _controller.setUniversidade(value),
                  ),
                ),
                Observer(
                  builder: (_) {
                    return DropDownWidget(
                      label: _controller.curso ?? "Curso",
                      searchHintText: "Pesquise o curso",
                      options: kCursos,
                      onSelected: (value) => _controller.setCurso(value),
                    );
                  },
                ),
                Observer(
                  builder: (_) => DropDownWidget(
                    label: _controller.cargo ?? "Cargo",
                    searchHintText: "Pesquise o cargo",
                    options: const ["Tutor", "Mentor", "Corretor"],
                    onSelected: (value) => _controller.setCargo(value),
                  ),
                ),
                SignUpTextField(
                  label: "Senha",
                  onChanged: (value) => _controller.senha = value,
                  hide: true,
                ),
                SignUpTextField(
                  label: "Confirme a senha",
                  onChanged: (value) => _controller.senhaConfirmada = value,
                  hide: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Observer(
                    builder: (_) => ElevatedButtonWidget(
                      title: "Cadastrar",
                      icon: Icons.supervised_user_circle_outlined,
                      isLoading: _controller.isLoading,
                      onPressed: _controller.isLoading
                          ? () {}
                          : () async {
                              try {
                                await _controller.signUp();
                                if (mounted) {
                                  showSnackBar(context, "Usuário criado");
                                  Navigator.pop(context);
                                }
                              } on AuthException catch (e) {
                                showSnackBar(context, e.message());
                              }
                            },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
