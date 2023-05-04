import 'dart:ffi';

import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<CalculatorPage> {
  int _count = 0;
  String _text = "";
  int _itemCount = 20;
  int _crossAxis = 4;
  List<String> cal = [];
  String controller = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.maxFinite,
              // height: double.infinity,
              padding: _text.isEmpty
                  ? EdgeInsets.fromLTRB(
                      0,
                      MediaQuery.of(context).size.height * 0.1,
                      MediaQuery.of(context).size.width * 0.4,
                      0)
                  : EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      MediaQuery.of(context).size.height * 0.3,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.grey[800]),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  _text.isEmpty ? "Calculator" : _text,
                  style: const TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: GridView.builder(
              itemCount: _itemCount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _crossAxis),
              itemBuilder: ((context, index) {
                return ++_count % 4 == 0
                    ? Padding(
                        padding: index == 19
                            ? const EdgeInsets.all(12.0)
                            : const EdgeInsets.all(7.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            color: index == 19 ? Colors.blue : Colors.grey[800],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: InkWell(
                            onTap: () {
                              _text += _symbols[index];
                              if (_text.contains("AC") ||
                                  _text.contains("<>")) {
                                _text = "";
                                controller = "";
                              } else if (_text.contains("=")) {
                                int res = 0;
                                if (_text.contains("+") ||
                                    _text.contains("-")) {
                                  res = 0;
                                } else {
                                  res = 1;
                                }
                                _text = _text.substring(0, _text.length - 1);
                                print(_text);
                                _text.contains("+")
                                    ? _text
                                        .split("+")
                                        .forEach((e) => res += int.parse(e))
                                    : _text.contains("-")
                                        ? _text.split("-").forEach((e) => res =
                                            res - int.parse(e)) //check this
                                        : _text.contains("x")
                                            ? _text.split("x").forEach(
                                                (e) => res *= int.parse(e))
                                            : _text.contains("/")
                                                ? _text.split("/").forEach(
                                                    (e) => res = (res /
                                                            int.parse(
                                                                e)) //check this
                                                        .floor())
                                                : _text.split("%").forEach(
                                                    (e) => res %= int.parse(e));

                                //cal.forEach((e) => {res += int.parse(e)});
                                _text = res.toString();
                              }
                              setState(() {});
                            },
                            child: Center(
                              child: Text(
                                // _symbols.elementAt(_iter),,
                                index % 4 == 0 ? "" : _symbols[index],
                                // index.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          _text += _symbols[index];
                          if (_text.contains("AC") || _text.contains("<>")) {
                            _text = "";
                            controller = "";
                          } else if (_text.contains("=")) {
                            int res = 0;
                            _text = _text.substring(0, _text.length - 1);
                            _text.contains("+")
                                ? _text
                                    .split("+")
                                    .forEach((e) => res += int.parse(e))
                                : _text.contains("-")
                                    ? _text.split("-").forEach(
                                        (e) => res = res - int.parse(e))
                                    : _text.contains("x")
                                        ? _text
                                            .split("x")
                                            .forEach((e) => res *= int.parse(e))
                                        : _text.contains("/")
                                            ? _text.split("/").forEach((e) =>
                                                res = (res / int.parse(e))
                                                    .floor())
                                            : _text.split("%").forEach(
                                                (e) => res %= int.parse(e));
                            //cal.forEach((e) => {res += int.parse(e)});
                            _text = res.toString();
                          }

                          setState(() {});
                        },
                        child: Center(
                          child: Text(
                            _symbols[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _symbols = [
    "AC",
    "<=",
    "%",
    "÷",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "<>",
    "0",
    ".",
    "="
  ];
}
