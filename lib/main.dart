import 'package:first_flutter_app/my_widget_1/HandleTextField.dart';
import 'package:flutter/material.dart';

import 'my_widget_2_form/FormBasic.dart';
import 'my_widget_2_form/TextFormFieldTest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TextFormFieldTest(),
    );
  }
}