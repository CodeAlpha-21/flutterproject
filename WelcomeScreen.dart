import 'package:flutter/material.dart';
import 'QuizScreen.dart';
import 'page3.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the Quiz App'), //appbar
        automaticallyImplyLeading: false, // to remove the upper arrow
        leading: null, // no leading
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Are you ready to start the quiz?',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the quiz screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizScreen()),
                );
              },
              child: const Text('What Sign Is This?'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the quiz screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const page3()),
                );
              },
              child: const Text('Guess The  Sign.'),
            ),
          ],
        ),
      ),
    );
  }
}
