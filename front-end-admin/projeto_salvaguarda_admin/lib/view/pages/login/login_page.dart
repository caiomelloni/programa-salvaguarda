import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_salvaguarda_admin/services/auth/errors/auth_exceptions.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/buttons/elevated_button_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/safe_area_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/buttons/text_button_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/snackbar.dart';
import 'package:projeto_salvaguarda_admin/view/components/text_form_field_widget.dart';
import 'package:projeto_salvaguarda_admin/view/pages/home/home_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/login/store/login_store.dart';
import 'package:projeto_salvaguarda_admin/view/pages/signup/signup_page.dart';

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
                                if (AuthService.instance.isLogged && mounted) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                }
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
