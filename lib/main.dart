import 'package:flutter/material.dart';
import 'package:onetastic/jokes/jokes.dart';

import 'calculator/calculator_page.dart';
import 'clock/clock_home.dart';
import 'quote/quote_page.dart';
import 'weather/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherPage(),
    );
  }
}
