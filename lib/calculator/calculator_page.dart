import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<CalculatorPage> {
  int _count = 0;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            // flex: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.grey[800]),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
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
                            child: Center(
                              child: Text(
                                // _symbols.elementAt(_iter),,
                                index % 4 == 0
                                    ? "1"
                                    : _symbols[(index / 4).toInt() + 1],
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
}
