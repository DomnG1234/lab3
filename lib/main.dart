import 'package:flutter/material.dart';
import 'package:lab_quiz/pagina principala.dart';
void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAM lab3 ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const WelcomeScreen(),
    );
  }
}