import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JokePage extends StatefulWidget {
  const JokePage({super.key});

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  String setup = "setup";
  String delivery = "delivery";
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
    var res = await http.get(Uri.parse('https://v2.jokeapi.dev/joke/Any'));
    // print(json.decode(res.body)['setup']);
    var data = json.decode(res.body);
    setup = data['setup'];
    delivery = data['delivery'];
    // print(setup + " " + delivery);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
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
                              setup,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          Center(
                            child: Text(
                              delivery,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => fetchData(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
