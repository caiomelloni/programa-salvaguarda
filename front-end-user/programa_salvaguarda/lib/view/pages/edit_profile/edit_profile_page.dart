import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';
import 'package:programa_salvaguarda/view/components/app_bar_widget.dart';
import 'package:programa_salvaguarda/view/components/buttons/elevated_button_widget.dart';
import 'package:programa_salvaguarda/view/components/page_padding_widget.dart';
import 'package:programa_salvaguarda/view/components/safe_area_widget.dart';
import 'package:programa_salvaguarda/view/components/snackbar.dart';
import 'package:programa_salvaguarda/view/components/text_form_field_widget.dart';
import 'package:programa_salvaguarda/view/pages/edit_profile/store/edit_profile_store.dart';
import 'package:programa_salvaguarda/view/pages/signup/utils/card_formater.dart';

final _controller = EditProfileController();

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  static const pageName = "/editProfile";

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        appBar: getAppBarWidget(context, canPop: true, showActions: false),
        body: PagePaddingWidget(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormFieldWidget(
                  labelText: "nome",
                  primaryColor: AppColors.lightPurple,
                  controller: _controller.nomeController,
                ),
                TextFormFieldWidget(
                  labelText: "sobrenome",
                  primaryColor: AppColors.lightPurple,
                  controller: _controller.sobrenomeController,
                ),
                TextFormFieldWidget(
                  labelText: "email",
                  primaryColor: AppColors.lightPurple,
                  controller: _controller.emailController,
                ),
                TextFormFieldWidget(
                  labelText: "telefone",
                  primaryColor: AppColors.lightPurple,
                  controller: _controller.telefoneController,
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
                TextFormFieldWidget(
                  labelText: "curso",
                  primaryColor: AppColors.disabled,
                  controller: _controller.cursoController,
                  enabled: false,
                ),
                TextFormFieldWidget(
                  labelText: "universidade",
                  primaryColor: AppColors.disabled,
                  controller: _controller.universidadeController,
                  enabled: false,
                ),
                TextFormFieldWidget(
                  labelText: "cargo",
                  primaryColor: AppColors.disabled,
                  controller: _controller.cargoController,
                  enabled: false,
                ),
                TextFormFieldWidget(
                  labelText: "horas no programa",
                  primaryColor: AppColors.disabled,
                  controller: _controller.horasProjetoController,
                  enabled: false,
                ),
                TextFormFieldWidget(
                  labelText: "entrada",
                  primaryColor: AppColors.disabled,
                  controller: _controller.entradaController,
                  enabled: false,
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (context) => ElevatedButtonWidget(
                    title: "Salvar altera????es",
                    isLoading: _controller.isLoading,
                    icon: Icons.check,
                    onPressed: _controller.isLoading
                        ? () {}
                        : () async {
                            try {
                              await _controller.updateUser();
                              if (mounted) {
                                showSnackBar(
                                    context, "Informa????es atualizadas");
                              }
                            } catch (e) {
                              if (mounted) {
                                showSnackBar(context,
                                    "Erro ao atualizar, tente novamente");
                              }
                            }
                          },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
