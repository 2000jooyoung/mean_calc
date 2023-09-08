import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.changedCallback,
    required this.textController,
  });

  final String labelText;
  final String hintText;
  final Function(String) changedCallback;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
            child: TextField(
              controller: textController,
              onChanged: changedCallback,
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
                labelStyle: const TextStyle(color: Colors.blue),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Colors.blue),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: Colors.blue),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ],
      );
}
