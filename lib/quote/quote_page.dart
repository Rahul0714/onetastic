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
            body: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.maxFinite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  quote,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                              Text(
                                "- $auther",
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Card(
                      //   child: Text(
                      //     delivery,
                      //     style: const TextStyle(
                      //         fontSize: 24, fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                    ],
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => fetchData(),
              child: Icon(Icons.refresh),
            ),
          );
  }
}
