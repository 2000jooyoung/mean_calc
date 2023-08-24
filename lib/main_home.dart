import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calculator_home.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Main Menu'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                child: CupertinoButton(
                  color: Colors.black,
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: const Text('Calculate my GPA'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const CalculatorHome(
                                title: "Add your grade",
                              )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
