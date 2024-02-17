import 'package:flutter/material.dart';

class LedMatrixPage extends StatefulWidget {
  @override
  _LedMatrixPageState createState() => _LedMatrixPageState();
}

class _LedMatrixPageState extends State<LedMatrixPage> {
  int _number = 0;

  List<List<List<int>>> _digits = [
    // Digit 0
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 1
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ]
  ];

  Widget ButtonUp() {
    return ButtonTheme(
      minWidth: 90.0,
      height: 90.0,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _number = (_number + 1) % 100;
          });
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20.0),
          primary: Color.fromARGB(126, 245, 234, 24),
        ),
        child: Icon(
          Icons.arrow_drop_up,
          size: 70.0,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Widget ButtonDown() {
    return ButtonTheme(
      minWidth: 90.0,
      height: 90.0,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _number = (_number - 1) % 100;
            if (_number < 0) _number = 99;
          });
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20.0),
          primary: Color.fromARGB(127, 9, 115, 230),
        ),
        child: Icon(
          Icons.arrow_drop_down,
          size: 70.0,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? Color.fromARGB(255, 7, 178, 231)
            : Color.fromARGB(255, 21, 21, 21),
      ),
    );
  }

  Widget _buildRow(List<int> row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: row.map((dot) => _buildDot(dot == 1)).toList(),
    );
  }

  Widget _buildDigit(int digit) {
    List<List<int>> digitData = _digits[digit];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: digitData.map((row) => _buildRow(row)).toList(),
    );
  }

  Widget _buildDoubleDigit(int number) {
    int tens = number ~/ 10;
    int units = number % 10;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDigit(tens),
        SizedBox(width: 10),
        _buildDigit(units),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 32),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonUp(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Color.fromARGB(255, 106, 18, 18),
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 235, 125, 197).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  width: 400,
                  height: 300,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: _buildDoubleDigit(_number),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonDown(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}