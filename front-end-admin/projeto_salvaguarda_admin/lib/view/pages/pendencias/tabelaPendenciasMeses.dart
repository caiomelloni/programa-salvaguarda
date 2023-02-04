import 'package:projeto_salvaguarda_admin/data/pendencies.dart';
import 'package:projeto_salvaguarda_admin/data/users.dart';
import 'package:projeto_salvaguarda_admin/model/pendency.dart';
import 'package:projeto_salvaguarda_admin/model/user.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/get_pendencies_from_api.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/getUsersFromAPI.dart';
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
  List<SalvaGuardaVolunteers> usersFiltered = [];
  @override
  void initState() {
    super.initState();
    dropdownValue = DateTime.now().year.toString();
    fetchSalvaGuardaVolunteers().then(
      (value) {
        usersFiltered = value;
        setState(() {});
      },
    );
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
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 1,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Fevereiro",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 2,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Março",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 3,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Abril",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 4,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Maio",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 5,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Junho",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 6,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Julho",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 7,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Agosto",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 8,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Setembro",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 9,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Outubro",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 10,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Novembro",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 11,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Dezembro",
                      usersFiltered: usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 12,
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
  final List<SalvaGuardaVolunteers> usersFiltered;
  final String dropdownValue;
  final int month;

  const _ButtonMonth({
    required this.texto,
    required this.usersFiltered,
    required this.dropdownValue,
    required this.month,
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
                      users: usersFiltered,
                      ano: dropdownValue,
                      month: month,
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
