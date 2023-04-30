import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:slider_button/slider_button.dart';

class ClockApp extends StatefulWidget {
  const ClockApp({super.key});

  @override
  State<ClockApp> createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ]),
      body: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * .05, 0,
            MediaQuery.of(context).size.width * .05, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Alarm",
              style: TextStyle(color: Colors.white, fontSize: 45),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "04:55",
                    style: TextStyle(color: Colors.white38, fontSize: 34),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Alarm 1",
                        style: TextStyle(color: Colors.white38, fontSize: 21),
                      ),
                      Text(
                        "Tomorrow",
                        style: TextStyle(color: Colors.white38, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "04:01",
                    style: TextStyle(color: Colors.white38, fontSize: 34),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Alarm 2",
                        style: TextStyle(color: Colors.white38, fontSize: 21),
                      ),
                      Text(
                        "Tomorrow",
                        style: TextStyle(color: Colors.white38, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        items: const <Widget>[
          Icon(Icons.alarm),
          Icon(Icons.alarm_add_rounded),
          Icon(Icons.timer),
          Icon(Icons.stop),
        ],
        color: Colors.white38,
        buttonBackgroundColor: Colors.white38,
        backgroundColor: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
      ),
    );
  }
}
