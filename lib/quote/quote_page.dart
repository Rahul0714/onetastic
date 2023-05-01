import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  String quote = "";
  String auther = "";
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });
    var res = await http.get(
      Uri.parse('https://type.fit/api/quotes'),
    );
    var data = json.decode(res.body);
    print(data.length);
    quote = data[Random().nextInt(data.length)]['text'];
    auther = data[Random().nextInt(data.length)]['author'];
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return quote.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            quote,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '- $auther',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => fetchData(),
              child: Icon(Icons.refresh),
            ),
          );
  }
}
