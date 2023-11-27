import 'package:flutter/material.dart';
import 'check.dart';
import 'page5.dart';
class page4 extends StatefulWidget {
  final Counter counter;

  page4({required this.counter});
  @override
  _page4State createState() => _page4State();
}

class _page4State extends State<page4> {
  List<String> imageAssets = [
    'assets/79.jpg',
    'assets/slip.jpg',
    'assets/uturn.jpg',
    'assets/leftre.jpg',
  ];

  int correctAnswerIndex = 2;
  bool hasUserAnswered = false;

  void checkAnswer(int selectedAnswerIndex) {
    if (!hasUserAnswered) {
      setState(() {
        hasUserAnswered = true;
        if (selectedAnswerIndex == correctAnswerIndex) {
          print('Correct!');
          widget.counter.increment();
        } else {
          print('Wrong!.');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Returning false prevents the user from going back
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false, // to remove the upper arrow
        leading: null,
          title: Text('Picture Quiz'),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Choose the correct picture of U turn sign:',
                style: TextStyle(fontSize: 20),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: imageAssets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    checkAnswer(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: hasUserAnswered
                            ? index == correctAnswerIndex
                            ? Colors.green // Correct answer
                            : Colors.red // Incorrect answer
                            : Colors.black, // Default border color
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.asset(
                        imageAssets[index],
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => page5(counter: widget.counter)),
                );
              },
              child: Text('next question'),
            ),
          ],
        ),
      ),
    );
  }
}
