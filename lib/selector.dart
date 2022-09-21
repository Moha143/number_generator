// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:number_generator/range_form.dart';

import 'Random_page.dart';

class Selector extends HookWidget {
  final formKey = GlobalKey<FormState>();
  Selector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Select Range"),
      ),
      body: FormRange(
        formKey: formKey,
        maxValueSetter: (value) => min.value = value,
        minValueSetter: (value) => max.value = value,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  RandomizerPage(min: min.value, max: max.value),
            ));
          }
        },
        child: Icon(Icons.arrow_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RangeSelectotTextForm extends StatelessWidget {
  RangeSelectotTextForm({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);
  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      // ignore: prefer__ructors
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
