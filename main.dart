import 'package:flutter/material.dart';
import 'check.dart';
import 'page3.dart';
import 'score.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => page3(counter: myCounter),
        '/last_score': (context) => LastScorePage(counter: myCounter),
      },
    );
  }
}

