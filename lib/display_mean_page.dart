import 'package:flutter/material.dart';

import 'editable_score_table.dart';

class DisplayMeanPage extends StatelessWidget {
  const DisplayMeanPage({
    super.key,
    required this.editableTable,
  });

  final EditableScoreTable editableTable;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            editableTable.getDataTable(),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 220, 209),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  editableTable.calculateMean(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
