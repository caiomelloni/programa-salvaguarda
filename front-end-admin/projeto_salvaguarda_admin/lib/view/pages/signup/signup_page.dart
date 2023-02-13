import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_salvaguarda_admin/view/components/buttons/elevated_button_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/safe_area_widget.dart';
import 'package:projeto_salvaguarda_admin/view/pages/signup/components/signup_textfield.dart';
import 'package:projeto_salvaguarda_admin/view/pages/signup/store/signup_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/signup/store/utils/card_formater.dart';

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
                const Text("Cadastre-se",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const Divider(color: Colors.black, thickness: 1.5),
                const Text("Dados Pessoais", style: TextStyle(fontSize: 15)),
                SignUpTextField(
                    label: "Nome",
                    onChanged: (value) => _controller.setNome(value)),
                SignUpTextField(
                    label: "Sobrenome",
                    onChanged: (value) => _controller.setSobrenome(value)),
                SignUpTextField(
                    label: "Email",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => _controller.setEmail(value)),
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
                              bool signedUp = await _controller.signUp(context);

                              if (signedUp && mounted) {
                                Navigator.pop(context);
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
