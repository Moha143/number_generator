// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  const RandomizerPage({Key? key, required this.min, required this.max})
      : super(key: key);
  final int min, max;

  @override
  State<RandomizerPage> createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  int? _generatedNumber;
  final randomGenerator = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_constructors
        appBar: AppBar(title: Text('Randomizer Page')),
        body: Center(
            child: Text(
          _generatedNumber.toString() ?? 'Generate a Number',
          style: TextStyle(
            fontSize: 42,
          ),
        )),
        floatingActionButton: FloatingActionButton.extended(
            label: Text('Generate'),
            onPressed: () {
              setState(() {
                _generatedNumber = widget.min +
                    randomGenerator.nextInt(widget.max + 1 - widget.min);
              });
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
