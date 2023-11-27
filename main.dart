import 'package:flutter/material.dart';
import 'WelcomeScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Picture Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const WelcomeScreen(), // Display the welcome screen initially
    );
  }
}



