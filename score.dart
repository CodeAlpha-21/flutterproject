import 'package:flutter/material.dart';
import 'check.dart'; // Import the Counter class

class LastScorePage extends StatelessWidget {
  final Counter counter;

  LastScorePage({required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last Score Page'),
          automaticallyImplyLeading: false, // to remove the upper arrow
        leading: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Last Score:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '${counter.count}',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the main screen (MyApp)
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Return to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
