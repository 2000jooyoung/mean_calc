import 'package:flutter/material.dart';
import 'package:mean_calc/src/constants/app_sizes.dart';
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
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    snapshot.data!.getDataTable(),
                    gapH20,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 25, 50, 25),
                        child: Text(
                          snapshot.data!.calculateMean(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
