import 'package:flutter/material.dart';
import 'check.dart';
import 'page2.dart';

class page1 extends StatefulWidget {
  final Counter counter;

  page1({required this.counter});
  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  List<String> imageAssets = [
    'assets/slip.jpg',
    'assets/no.jpg',
    'assets/stop.jpg',
    'assets/const.jpg',
  ];
  Counter counter = Counter();
  int correctAnswerIndex = 0;
  bool hasUserAnswered = false;

  void checkAnswer(int selectedAnswerIndex) {
    if (!hasUserAnswered) {
      setState(() {
        hasUserAnswered = true;
        if (selectedAnswerIndex == correctAnswerIndex) {
          widget.counter.increment();
          print('Correct!');
        } else {
          print('Wrong! Try again.');
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
        title: Text('Picture Quiz'),
        automaticallyImplyLeading: false, // to remove the upper arrow
        leading: null,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Choose the correct picture of slippery road sign:',
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
          SizedBox(height: 30,),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(

                    MaterialPageRoute(builder: (context) => page2(counter: widget.counter,))
                );
              },
              child: const Icon(Icons.navigate_next, size: 50)
          ),
          SizedBox(height: 30,),
          Text('Current count: ${counter.count}'),
        ],
      ),
    ));
  }
}
