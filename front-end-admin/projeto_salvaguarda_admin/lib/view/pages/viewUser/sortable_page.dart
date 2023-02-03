import 'package:intl/intl.dart';
import 'package:projeto_salvaguarda_admin/data/pendencies.dart';
import 'package:projeto_salvaguarda_admin/data/users.dart';
import 'package:projeto_salvaguarda_admin/data/workloadData.dart';
import 'package:projeto_salvaguarda_admin/model/activity.dart';
import 'package:projeto_salvaguarda_admin/model/pendency.dart';
import 'package:projeto_salvaguarda_admin/model/user.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/getUsersFromAPI.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/visualizarDadosMonitorCorretor.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/visualizarDadosTutor.dart';
import 'package:projeto_salvaguarda_admin/view/pages/viewUser/widget/scrollable_widget.dart';
import 'package:flutter/material.dart';

class SortablePage extends StatefulWidget {
  const SortablePage({super.key});

  @override
  _SortablePageState createState() => _SortablePageState();
}

class _SortablePageState extends State<SortablePage> {
  int? sortColumnIndex;
  bool isAscending = false;
  TextEditingController controller = TextEditingController();
  String _searchResult = '';
  List<SalvaGuardaVolunteers> usersFiltered = [];
  List<SalvaGuardaVolunteers> _allUser = [];
  // List<User> usersFiltered = []; //mock para testes locais da parte visual
  // List<User> _allUser = []; //mock para testes locais da parte visual
  List<Pendency> _allPendencies = [];
  List<Activity> _allActivities = [];

  @override
  void initState() {
    super.initState();

    // usersFiltered = List.of(allUsers); //mock para testes locais da parte visual
    // _allUser = List.of(allUsers); //mock para testes locais da parte visual
    _allPendencies = List.of(allPendency);
    _allActivities = List.of(allWorkloads);
    fetchSalvaGuardaVolunteers().then(
      (value) {
        _allUser = value;
        usersFiltered = value;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(child: buildDataTable()),
        ),
      );

  Widget buildDataTable() {
    final columns = ['Nome', 'Cargo', 'Última Atualização'];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.search),
              title: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                  onChanged: (value) {
                    setState(() {
                      _searchResult = value;
                      usersFiltered = _allUser
                          .where((user) => user.name
                              .toLowerCase()
                              .contains(_searchResult.toLowerCase()))
                          .toList();
                    });
                  }),
              trailing: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  setState(() {
                    controller.clear();
                    _searchResult = '';
                    usersFiltered = _allUser;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 380,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: ScrollableWidget(
              child: DataTable(
                showCheckboxColumn: false,
                sortAscending: isAscending,
                sortColumnIndex: sortColumnIndex,
                rows: getRows(usersFiltered),
                columns: getColumns(columns),
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color.fromARGB(234, 235, 77, 10)),
                border: const TableBorder(
                    horizontalInside: BorderSide(
                        color: Colors.grey, style: BorderStyle.solid)),
                headingTextStyle: const TextStyle(
                    color: Color.fromARGB(181, 136, 38, 189),
                    fontWeight: FontWeight.bold),
                columnSpacing: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<SalvaGuardaVolunteers> users) =>
      users.map((SalvaGuardaVolunteers user) {
        // List<DataRow> getRows(
        //         List<User> users) => //mock para testes locais da parte visual
        // users.map((User user) {
        //mock para testes locais da parte visual
        final cells = [
          user.name,
          user.role,
          DateFormat('dd/MM/yyyy').format(user.dtUpdated),
        ];
        return DataRow(
          cells: getCells(cells),
          onSelectChanged: (value) {
            (user.role == 'Tutor') //não ta indo pra onde eu quero
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VisualizarDadosTutor(
                              user: user,
                              userPendency: _allPendencies
                                  .where((e) => e.idUser == user.id)
                                  .toList(),
                              userActivity: _allActivities
                                  .where((e) => e.idUser == user.id)
                                  .toList(),
                            )))
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VisualizarDadosMoniCorret(
                              user: user,
                              userPendency: _allPendencies
                                  .where((e) => e.idUser == user.id)
                                  .toList(),
                              userActivity: _allActivities
                                  .where((e) => e.idUser == user.id)
                                  .toList(),
                            )));
          },
        );
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      usersFiltered.sort(
          (user1, user2) => compareString(ascending, user1.name, user2.name));
    } else if (columnIndex == 1) {
      usersFiltered.sort(
          (user1, user2) => compareString(ascending, user1.role, user2.role));
    } else if (columnIndex == 2) {
      usersFiltered.sort((user1, user2) =>
          compareString(ascending, '${user1.dtUpdated}', '${user2.dtUpdated}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
