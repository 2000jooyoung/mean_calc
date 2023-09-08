import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mean_calc/editable_score_table.dart';
import 'package:mean_calc/src/common_widgets/responsive_center.dart';
import 'package:mean_calc/src/constants/app_sizes.dart';
import 'package:mean_calc/src/features/input_subjects/add_subject_input_form.dart';
import 'package:mean_calc/src/features/products/presentation/home_app_bar/home_app_bar.dart';
import 'package:mean_calc/src/models/target_subject.dart';
import 'package:mean_calc/src/routing/app_router.dart';

class InputSubjectHome extends StatefulWidget {
  const InputSubjectHome({
    super.key,
  });

  @override
  State<InputSubjectHome> createState() => _InputSubjectHomeState();
}

class _InputSubjectHomeState extends State<InputSubjectHome> {
  // * Use a [ScrollController] to register a listener that dismisses the
  // * on-screen keyboard when the user scrolls.
  // * This is needed because this page has a search field that the user can
  // * type into.
  final _scrollController = ScrollController();
  var subject = const TargeSubject(name: "name", grade: 0.0, coefficient: 0);
  List<TextEditingController> fieldTextList = [
    for (var i = 0; i < 3; i += 1) TextEditingController()
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_dismissOnScreenKeyboard);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_dismissOnScreenKeyboard);
    super.dispose();
  }

  // When the search text field gets the focus, the keyboard appears on mobile.
  // This method is used to dismiss the keyboard when the user scrolls.
  void _dismissOnScreenKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeAppBar(),
        body: SingleChildScrollView(
          child: AddSubjectInputForm(
            fieldTextList: fieldTextList,
            subject: subject,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
            icon: const Icon(Icons.arrow_circle_right_outlined),
            onPressed: () {
              context.goNamed(AppRoutee.calculateMean.name);
            },
          ),
        ));
  }
}
