import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  var myController = PageController(initialPage: 0, keepPage: true);
  bool horizontalAxis = true;
  bool pageSnapping = true;
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection:
                horizontalAxis == true ? Axis.horizontal : Axis.vertical,
            reverse: reverse,
            controller: myController,
            pageSnapping: pageSnapping,
            //Scroll hassasiyeti
            onPageChanged: (index) {},
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.indigo.shade400,
                child: const Center(
                  child: Text(
                    "Sayfa 0",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.amber.shade400,
                child: const Center(
                  child: Text(
                    "Sayfa 1",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Yatay eksende çalış'),
                      Checkbox(
                          value: horizontalAxis,
                          onChanged: (b) {
                            setState(() {
                              horizontalAxis = b!;
                            });
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Page Snapping'),
                      Checkbox(
                          value: pageSnapping,
                          onChanged: (b) {
                            setState(() {
                              pageSnapping = b!;
                            });
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Reverse'),
                      Checkbox(
                          value: reverse,
                          onChanged: (b) {
                            setState(() {
                              reverse = b!;
                            });
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
