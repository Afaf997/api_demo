import 'package:flutter/material.dart';
import 'package:model_api/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Homescreen(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
