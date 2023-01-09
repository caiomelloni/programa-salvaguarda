import 'package:projeto_salvaguarda_admin/data/users.dart';
import 'package:projeto_salvaguarda_admin/model/user.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/view/pages/login/login_page.dart';
import 'package:projeto_salvaguarda_admin/view/pages/pendencias/listaPendenciasMes.dart';
import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';

class TabelaPendenciasMeses extends StatefulWidget {
  const TabelaPendenciasMeses({super.key});

  @override
  State<TabelaPendenciasMeses> createState() => _TabelaPendenciasMesesState();
}

class _TabelaPendenciasMesesState extends State<TabelaPendenciasMeses> {
  List<String> listYears = getYears();
  String dropdownValue = '';
  List<User> usersFiltered = []; //mock para testes locais da parte visual
  List<User> _allUser = []; //mock para testes locais da parte visual

  @override
  void initState() {
    super.initState();
    dropdownValue = DateTime.now().year.toString();
    usersFiltered = List.of(allUsers); //mock para testes locais da parte visual
    _allUser = List.of(allUsers); //mock para testes locais da parte visual
  }

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
            "Selecione um Mês",
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Ano",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.lightPurple,
                            fontWeight: FontWeight.w400,
                            fontSize: 23,
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 100,
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            items: listYears
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 18),
                                  ));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    ButtonMonth(
                      texto: "Janeiro",
                      onPressed: () {
                        //List<Var> pendenciesList = ;
                      },
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Fevereiro",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Março",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Abril",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Maio",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Junho",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Julho",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Agosto",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Setembro",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Outubro",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Novembro",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 25),
                    ButtonMonth(
                      texto: "Dezembro",
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonMonth extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  const ButtonMonth({
    required this.texto,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  texto,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 23, color: AppColors.lightPurple),
                )
              ],
            )
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}

List<String> getYears() {
  int currentYear = DateTime.now().year;

  List<String> yearsTilPresent = [];
  int year = 2020;

  while (year <= currentYear) {
    yearsTilPresent.add(year.toString());
    year++;
  }

  return yearsTilPresent;
}
