import 'package:projeto_salvaguarda_admin/services/getPendencies/errors/pendencies_api_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/view/components/app_bar_profile.dart';
import 'package:projeto_salvaguarda_admin/view/components/snackbar.dart';
import 'package:projeto_salvaguarda_admin/view/pages/pendencias/listaPendenciasMes.dart';
import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';

import '../viewUser/store_pendencies/pendency_api_store.dart';

PendecyApiController _pendecyApiController = PendecyApiController();

class TabelaPendenciasMeses extends StatefulWidget {
  final List<SalvaGuardaVolunteers> usersFiltered;
  const TabelaPendenciasMeses({
    Key? key,
    required this.usersFiltered,
  }) : super(key: key);
  @override
  State<TabelaPendenciasMeses> createState() => _TabelaPendenciasMesesState();
}

class _TabelaPendenciasMesesState extends State<TabelaPendenciasMeses> {
  List<String> listYears = getYears();
  String dropdownValue = '';
  @override
  void initState() {
    super.initState();
    dropdownValue = DateTime.now().year.toString();
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
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 1,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Fevereiro",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 2,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Março",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 3,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Abril",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 4,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Maio",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 5,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Junho",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 6,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Julho",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 7,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Agosto",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 8,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Setembro",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 9,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Outubro",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 10,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Novembro",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 11,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
                    ),
                    const SizedBox(width: 25),
                    _ButtonMonth(
                      texto: "Dezembro",
                      usersFiltered: widget.usersFiltered,
                      dropdownValue: dropdownValue,
                      month: 12,
                      isLoading: _pendecyApiController.isLoading,
                      controller: _pendecyApiController,
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
  final bool? isLoading;
  final PendecyApiController controller;
  // final VoidCallback onPressed;

  const _ButtonMonth({
    required this.texto,
    required this.usersFiltered,
    required this.dropdownValue,
    required this.month,
    required this.controller,
    // required this.onPressed,
    this.isLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoadingButton = isLoading ?? false;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.black38,
        elevation: 5,
      ),
      onPressed: isLoadingButton
          ? () {}
          : () async {
              try {
                await controller.tryFetchPendencies().then(
                  (value) {
                    value ??= [];
                    if (value.isNotEmpty) {
                      value = value
                          .where((e) =>
                              e.dtCreated.year == int.parse(dropdownValue) &&
                              e.dtCreated.month == month)
                          .toList();
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListaPendenciasMes(
                          users: usersFiltered,
                          pendencies: value!,
                          ano: dropdownValue,
                        ),
                      ),
                    );
                  },
                );
              } on CantFetchPendenciesException catch (e) {
                showSnackBar(context, e.message());
              }
            },
      child: SizedBox(
        height: 35,
        width: 380,
        child: isLoadingButton
            ? const Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: AppColors.yellow)))
            : Column(
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
