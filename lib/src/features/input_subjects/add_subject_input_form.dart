import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mean_calc/editable_datatable.dart';
import 'package:mean_calc/editable_score_table.dart';
import 'package:mean_calc/src/common_widgets/action_text_button.dart';
import 'package:mean_calc/src/common_widgets/input_form.dart';
import 'package:mean_calc/src/common_widgets/responsive_center.dart';
import 'package:mean_calc/src/constants/app_sizes.dart';
import 'package:mean_calc/src/features/firestore/login_info.dart';
import 'package:mean_calc/src/features/firestore/reposotory/subject_repository.dart';
import 'package:mean_calc/src/models/target_subject.dart';

class AddSubjectInputForm extends StatefulWidget {
  AddSubjectInputForm({
    super.key,
    required this.fieldTextList,
    required this.subject,
  });

  final List<TextEditingController> fieldTextList;
  final TargeSubject subject;
  EditableScoreTable table = EditableScoreTable([
    'name',
    'grade',
    'coefficient',
  ]);

  @override
  State<AddSubjectInputForm> createState() => _AddSubjectInputFormState();
}

class _AddSubjectInputFormState extends State<AddSubjectInputForm> {
  @override
  void initState() {
    super.initState();
    initTable();
  }

  Future<String> initTable() async {
    LoginInfo li = LoginInfo();
    TaskRepository repo = TaskRepository(userId: li.userId ?? "");
    final subjects = await repo.getAllSubjectsFromUserId();

    for (var subject in subjects) {
      widget.table.setRowFromSubject(subject);
    }

    return "toto";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          InputForm(
              labelText: "Name",
              hintText: "name",
              changedCallback: (text) {},
              textController: widget.fieldTextList[0]),
          InputForm(
              labelText: "Grade",
              hintText: "grade",
              changedCallback: (text) {},
              textController: widget.fieldTextList[1]),
          InputForm(
              labelText: "Coefficient",
              hintText: "coefficient",
              changedCallback: (text) {},
              textController: widget.fieldTextList[2]),
          ActionTextButton(
            text: "Add Subject",
            onPressed: onAddSubject,
          ),
          FutureBuilder(
              future: initTable(),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  print("Go");
                  return widget.table.getDataTable();
                } else {
                  print("Not yet");
                  return widget.table.getDataTable();
                }
              }),
        ],
      ),
    );
  }

  void onAddSubject() async {
    LoginInfo li = LoginInfo();
    TaskRepository repo = TaskRepository(userId: li.userId ?? "");
    TargeSubject task = TargeSubject(
      name: widget.fieldTextList[0].text,
      grade: double.tryParse(widget.fieldTextList[1].text) ?? 0.0,
      coefficient: int.tryParse(widget.fieldTextList[2].text) ?? 0,
    );
    final subjects = await repo.getAllSubjectsFromUserId();
    widget.table.resetTable();
    for (var subject in subjects) {
      widget.table.setRowFromSubject(subject);
    }
    widget.table.setRowFromSubject(task);

    for (var field in widget.fieldTextList) {
      field.clear();
    }
    await repo.addSubject(task);
    setState(() {});
  }
}
