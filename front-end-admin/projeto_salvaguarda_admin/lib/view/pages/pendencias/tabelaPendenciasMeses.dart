import 'package:projeto_salvaguarda_admin/data/users.dart';
import 'package:projeto_salvaguarda_admin/model/user.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
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
  List<User> _allUsers = []; //mock para testes locais da parte visual

  @override
  void initState() {
    super.initState();
    dropdownValue = DateTime.now().year.toString();
    usersFiltered = List.of(allUsers); //mock para testes locais da parte visual
    _allUsers = List.of(allUsers); //mock para testes locais da parte visual
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidget(context, canPop: true, showActions: true),
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
                    _ButtonMonth(
                      texto: "Janeiro",
                      month: 1,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Fevereiro",
                      month: 2,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Março",
                      month: 3,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Abril",
                      month: 4,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Maio",
                      month: 5,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Junho",
                      month: 6,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Julho",
                      month: 7,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Agosto",
                      month: 8,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Setembro",
                      month: 9,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Outubro",
                      month: 10,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Novembro",
                      month: 11,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Dezembro",
                      month: 12,
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
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

class _ButtonMonth extends StatelessWidget {
  final String texto;
  final int month;
  final List<User> usersFiltered;
  final String dropdownValue;

  const _ButtonMonth({
    required this.texto,
    required this.month,
    required this.usersFiltered,
    required this.dropdownValue,
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
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListaPendenciasMes(
                      users: usersFiltered
                          .where((user) => user.pendencies
                              .where((element) =>
                                  element.year == int.parse(dropdownValue) &&
                                  element.month == month)
                              .toList()
                              .isNotEmpty)
                          .toList(),
                      ano: dropdownValue,
                    )));
      },
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
    );
  }
}

List<String> getYears() {
  int currentYear = DateTime.now().year;
  int numberYears = 4;

  List<String> yearsTilPresent = [];

  while (numberYears >= 0) {
    yearsTilPresent.add((currentYear - numberYears).toString());
    numberYears -= 1;
  }

  return yearsTilPresent;
}
