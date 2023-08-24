import 'package:flutter/material.dart';

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
  void setRowsDict(row) {
    rowDicts.add(row);
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
        ));
      }
      rows.add(
        DataRow(
          cells: cells,
        ),
      );
    }
    return DataTable(
      columns: column,
      rows: rows,
    );
  }
}
