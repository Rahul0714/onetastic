import 'package:flutter/material.dart';
import 'package:onetastic/jokes/jokes.dart';
import 'package:transparent_image/transparent_image.dart';

import 'calculator/calculator_page.dart';
import 'clock/clock_home.dart';
import 'quote/quote_page.dart';
import 'weather/weather_page.dart';

class HomemPageT extends StatefulWidget {
  const HomemPageT({super.key});

  @override
  State<HomemPageT> createState() => _HomemPageTState();
}

class _HomemPageTState extends State<HomemPageT> {
  int listNum = 0;

  void navigation(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => const JokePage()),
        ));
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const QuotePage()),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ClockApp()),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CalculatorPage()),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const WeatherPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              navigation(index);
            },
            child: Card(
              child: Center(
                child: Container(
                  child: index == 0
                      ? const Text("Jokes")
                      : index == 1
                          ? const Text("Quote")
                          : index == 2
                              ? const Text("Clock")
                              : index == 3
                                  ? const Text("Calculate")
                                  : index == 4
                                      ? const Text("Weather")
                                      : const Text('tbd'),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
