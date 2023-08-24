import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mean_calc/subjects.dart';

import 'display_mean_page.dart';
import 'editable_score_table.dart';
import 'input_form.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

String calculateMean(List<String> scores) {
  double totalScore = 0;
  int totalLength = 0;

  for (var score in scores) {
    try {
      totalScore += double.parse(score);
      totalLength += 1;
    } on Exception {
      continue;
    }
  }

  return (totalScore / totalLength).toString();
}

// what we need for the table
// 과목 이름, 점수, 학기, coefficient

class _CalculatorHomeState extends State<CalculatorHome> {
  List<DataRow> scoresArchive = [];
  List<String> scores = [for (var i = 0; i < 3; i += 1) ""];
  String result = "";
  List<TextEditingController> fieldTextList = [
    for (var i = 0; i < 3; i += 1) TextEditingController()
  ];
  EditableScoreTable table = EditableScoreTable([
    'name',
    'grade',
    'coefficient',
  ]);
  List<dynamic> jsonData = [];
  var anonymouId = "";

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithAnonymous() async {
    UserCredential credential = await _firebaseAuth.signInAnonymously();
    if (credential.user != null) {
      anonymouId = credential.user!.uid;
    }
    print(credential);
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await signInWithAnonymous();
    DocumentSnapshot<Map<String, dynamic>> dataDocument =
        await firestore.collection("subjects").doc(anonymouId).get();
    // 아노니머스 아이디로 바꾸시길
    Map<String, dynamic>? data = dataDocument.data();
    if (data == null) {
      return;
    }
    Subjects? subjectsData = Subjects.fromJson(data);
    for (var row in subjectsData.toJson()["subjects"]) {
      table.setRowsDict(row);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: const [], title: Text(widget.title)),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  InputForm(
                    labelText: "name",
                    hintText: "name",
                    changedCallback: (text) {
                      setState(() {
                        scores[0] = text;
                      });
                    },
                    textController: fieldTextList[0],
                  ),
                  InputForm(
                    labelText: "grade",
                    hintText: "GPA",
                    changedCallback: (text) {
                      setState(() {
                        scores[1] = text;
                      });
                    },
                    textController: fieldTextList[1],
                  ),
                  InputForm(
                    labelText: "coefficient",
                    hintText: "coefficient",
                    changedCallback: (text) {
                      setState(() {
                        scores[2] = text;
                      });
                    },
                    textController: fieldTextList[2],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 50,
                        onPressed: addRowInDataTable,
                        icon: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            child: const Icon(
                              Icons.add,
                            )),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        iconSize: 50,
                        onPressed: saveDataTableToJson,
                        icon: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlue,
                            ),
                            child: const Icon(
                              Icons.save_alt_rounded,
                            )),
                      ),
                    ],
                  ),
                  table.getDataTable(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              result = calculateMean(scores);
              Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => DisplayMeanPage(
                          editableTable: table,
                        )),
              );
            });
          },
          label: const Text('Calculate!'),
          icon: const Icon(Icons.calculate_outlined),
        ));
  }

  bool isListEmpty(List<String> targets) {
    for (var i = 0; i < targets.length; i++) {
      if (targets[i] == "") {
        return false;
      }
    }
    return true;
  }

  void saveDataTableToJson() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Map<String, dynamic> updateResult = {"subjects": table.getRowDicts()};

    //  이것도 아이디로

    Subjects updatedSubjects = Subjects.fromJson(updateResult);
    await firestore.collection("subjects").doc(anonymouId).set(
          updatedSubjects.toJson(),
        );

    setState(() {});
  }

  void addRowInDataTable() {
    if (isListEmpty(scores)) {
      setState(() {});
      // 좀 더 깔끔한 방법이 있을듯
      // firestore 를 사용한다면 좀 더 좋은 방법이 될듯함
      table.setRowsDict({
        'name': scores[0],
        'grade': scores[1],
        'coefficient': scores[2],
      });
      for (var i = 0; i < 3; i++) {
        fieldTextList[i].clear();
        scores[i] = "";
      }
    }
  }
}
