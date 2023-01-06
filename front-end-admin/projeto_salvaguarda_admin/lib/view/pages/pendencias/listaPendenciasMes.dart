import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/model/user.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';
import 'package:projeto_salvaguarda_admin/view/pages/login/login_page.dart';

class ListaPendenciasMes extends StatelessWidget {
  ListaPendenciasMes({
    super.key,
    required this.users,
  });
  late List<ButtonUser> buttonsList;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: const Color.fromRGBO(255, 214, 0, 100),
          ),
          backgroundColor: AppColors.lightPurple,
          title: const Text(
            "Pendências no Mês",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(255, 214, 0, 100),
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
              color: const Color.fromRGBO(255, 214, 0, 100),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                AuthService.service.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
              color: const Color.fromRGBO(255, 214, 0, 100),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ButtonUser(
                        nome: "André",
                        cargo: "Tutor",
                        onPressed: () {},
                      ),
                      ButtonUser(
                        nome: "Caio",
                        cargo: "Corretor",
                        onPressed: () {},
                      ),
                      ButtonUser(
                        nome: "João",
                        cargo: "Monitor",
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtonsWithNames() {
    for (int i = 0; i < users.length; i++) {
      buttonsList.add(ButtonUser(
        cargo: users[i].role,
        nome: users[i].name,
        onPressed: () {},
      ));
    }
    return buttonsList;
  }
}

class ButtonUser extends StatelessWidget {
  final String nome;
  final String cargo;
  final VoidCallback onPressed;
  const ButtonUser({
    required this.cargo,
    required this.nome,
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.black38,
            elevation: 5,
          ),
          child: SizedBox(
            height: 35,
            width: 380,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  nome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 23,
                      color: AppColors.lightPurple,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  cargo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 23,
                      color: AppColors.lightPurple,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
