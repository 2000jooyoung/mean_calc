import 'package:flutter/material.dart';
import 'package:mean_calc/src/features/firestore/login_info.dart';
import 'package:mean_calc/src/features/firestore/reposotory/subject_repository.dart';
import 'package:mean_calc/src/models/target_subject.dart';

class EditableDataTable {
  EditableDataTable(
    this.columns,
  );

  final List<String> columns;

  List<Map<String, dynamic>> rowDicts = [];

  // rowDicts gettor
  List<Map<String, dynamic>> getRowDicts() {
    return rowDicts;
  }

  // row settor
  void setRowsDict(Map<String, dynamic> row) {
    rowDicts.add(row);
  }

  void setRowFromSubject(TargeSubject subject) {
    rowDicts.add(subject.toJson());
  }

  void resetTable() {
    rowDicts = [];
  }

  Future<List<TargeSubject>> getAllSubjectsFromDB() async {
    LoginInfo li = LoginInfo();
    TaskRepository repo = TaskRepository(userId: li.userId ?? "");

    final subjects = await repo.getAllSubjectsFromUserId();
    for (var subject in subjects) {
      rowDicts.add(subject.toJson());
    }
    return subjects;
  }

  // table gettor
  DataTable getDataTable() {
    List<DataColumn> column = [
      for (var i = 0; i < columns.length; i += 1)
        DataColumn(
          label: Expanded(
            child: Text(
              columns[i],
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
    ];
    List<DataRow> rows = [];
    for (var row in rowDicts) {
      List<DataCell> cells = [];
      for (var columnName in columns) {
        cells.add(DataCell(
          Text(
            (row[columnName]).toString(),
          ),
          showEditIcon: columnName == "grade",
          onTap: () {
            print(row[columnName]);
          },
        ));
      }
      rows.add(
        DataRow(
          cells: cells,
          color: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            return null;
            // return Colors.amber.shade700; // Use the default value.
          }),
        ),
      );
    }
    return DataTable(
      dataRowColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          // return Colors.amberAccent;
          return null;
        }
        return null;
      }),
      columns: column,
      rows: rows,
      showCheckboxColumn: true,
    );
  }
}
