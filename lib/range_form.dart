import 'package:flutter/material.dart';
import 'package:number_generator/selector.dart';

typedef IntValueSetter = void Function(int value);

class FormRange extends StatelessWidget {
  const FormRange({
    Key? key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer__literals_to_create_immutables
          children: [
            RangeSelectotTextForm(
                labelText: 'Minimum', intValueSetter: minValueSetter),
            const SizedBox(height: 12),
            RangeSelectotTextForm(
                labelText: 'Maximum', intValueSetter: maxValueSetter),
          ],
        ),
      ),
    );
  }
}
