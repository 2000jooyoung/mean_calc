import 'package:flutter/material.dart';
import 'package:mean_calc/src/features/firestore/login_info.dart';
import 'package:mean_calc/src/features/firestore/reposotory/subject_repository.dart';

import 'editable_score_table.dart';

class DisplayMeanPage extends StatelessWidget {
  const DisplayMeanPage({
    super.key,
  });

  Future<EditableScoreTable> initTable() async {
    EditableScoreTable table = EditableScoreTable([
      'name',
      'grade',
      'coefficient',
    ]);

    LoginInfo li = LoginInfo();
    TaskRepository repo = TaskRepository(userId: li.userId ?? "");
    final subjects = await repo.getAllSubjectsFromUserId();

    for (var subject in subjects) {
      table.setRowFromSubject(subject);
    }

    return table;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: initTable(),
          builder: (context, AsyncSnapshot<EditableScoreTable> snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  snapshot.data!.getDataTable(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 220, 209),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        snapshot.data!.calculateMean(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const Placeholder();
            }
          },
        ),
      ),
    );
  }
}
