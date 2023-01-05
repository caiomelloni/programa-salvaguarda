import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/buttons/elevated_button_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/page_padding_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/safe_area_widget.dart';
import 'package:projeto_salvaguarda_admin/view/components/snackbar.dart';
import 'package:projeto_salvaguarda_admin/view/components/text_form_field_widget.dart';
import 'package:projeto_salvaguarda_admin/view/pages/edit_adm_profile/store/edit_profile_store.dart';

final _controller = EditProfileController();

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  static const pageName = '/editProfile';

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
                    title: "Salvar alterações",
                    isLoading: _controller.isLoading,
                    icon: Icons.check,
                    onPressed: _controller.isLoading
                        ? () {}
                        : () async {
                            try {
                              await _controller.updateUser();
                              if (mounted) {
                                showSnackBar(
                                    context, "Informações atualizadas");
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
