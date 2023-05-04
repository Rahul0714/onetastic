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
      backgroundColor: Colors.black,
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      setup,
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Container(
                    child: Text(
                      delivery,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
