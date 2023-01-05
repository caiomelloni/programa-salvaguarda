import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:programa_salvaguarda/services/auth/errors/auth_exceptions.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/view/components/buttons/elevated_button_widget.dart';
import 'package:programa_salvaguarda/view/components/page_padding_widget.dart';
import 'package:programa_salvaguarda/view/components/safe_area_widget.dart';
import 'package:programa_salvaguarda/view/components/buttons/text_button_widget.dart';
import 'package:programa_salvaguarda/view/components/snackbar.dart';
import 'package:programa_salvaguarda/view/components/text_form_field_widget.dart';
import 'package:programa_salvaguarda/view/pages/login/store/login_store.dart';
import 'package:programa_salvaguarda/view/pages/signup/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const pageName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.lightPurple,
          child: SingleChildScrollView(
            child: PagePaddingWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: FittedBox(
                      child: Image.asset(
                        "assets/Logoimag.png",
                      ),
                    ),
                  ),
                  TextFormFieldWidget(
                    labelText: "Usuário",
                    controller: controller.emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldWidget(
                      labelText: "Senha",
                      controller: controller.passwordController,
                      hide: true),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(height: 20),
                  Observer(
                    builder: (context) => ElevatedButtonWidget(
                      title: "Login",
                      icon: Icons.login,
                      isLoading: controller.isLoading,
                      onPressed: controller.isLoading
                          ? () {}
                          : () async {
                              try {
                                await controller.signIn();
                              } on AuthException catch (e) {
                                showSnackBar(context, e.message());
                              }
                            },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtonWidget(
                        title: "Cadastre-se",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const SignUpPage()),
                          );
                        },
                      ),
                      TextButtonWidget(
                        title: "Recuperar Senha",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
