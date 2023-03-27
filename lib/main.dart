import 'package:flutter/material.dart';
import 'package:vocab_eng_app/constant/globals.dart';
import 'package:vocab_eng_app/screens/utils/main_menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vocab for The World",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MainMenu(),
    );
  }
}