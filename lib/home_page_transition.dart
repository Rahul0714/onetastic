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
        itemCount: 8,
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
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage('assets/joke.png'),
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.height * 0.1,
                            ),
                            const Text(
                              'Jokes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        )
                      : index == 1
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: const AssetImage('assets/quote.png'),
                                  width:
                                      MediaQuery.of(context).size.height * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                const Text(
                                  "Quotes",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ],
                            )
                          : index == 2
                              ? Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: const [
                                    Image(
                                      image: AssetImage('assets/clock.avif'),
                                    ),
                                    Text(
                                      'Alarm',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                )
                              : index == 3
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              'assets/calculator.png'),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                        ),
                                        const Text(
                                          'Calculator',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                      ],
                                    )
                                  : index == 4
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: const AssetImage(
                                                  'assets/weather.png'),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                            ),
                                            const Text(
                                              'Weather',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        )
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
