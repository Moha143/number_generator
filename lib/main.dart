import 'package:flutter/material.dart';

import 'selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Selector(),
    );
  }
}
