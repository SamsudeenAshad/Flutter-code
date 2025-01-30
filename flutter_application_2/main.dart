import 'package.flutter/material.dart';

void main() {
  runApp(
    materialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
          CenterTitle: true,
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    ),
    ));
}