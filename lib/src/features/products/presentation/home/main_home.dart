import 'package:editable/editable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mean_calc/src/routing/app_router.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Main Menu'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
              child: CupertinoButton(
                color: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                child: const Text('Calculate my GPA'),
                onPressed: () async {
                  context.goNamed(AppRoutee.inputSubjects.name);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
