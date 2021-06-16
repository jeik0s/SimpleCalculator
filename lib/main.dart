import 'package:flutter/material.dart';

void main() {
  runApp(SimpleCalculator());
}

class SimpleCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: CalculatorCanvas()),
      ),
    );
  }
}

class CalculatorCanvas extends StatefulWidget {
  @override
  _CalculatorCanvasState createState() => _CalculatorCanvasState();
}

class _CalculatorCanvasState extends State<CalculatorCanvas> {
  String userInput1 = "";
  String userInput2 = "";
  String userSymbol = "";
  String calcScreen = "";

  bool checkIfNumeric({required String value}) {
    try {
      int.parse(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  void calculate({required String userInputValue}) {
    setState(() {
      if (checkIfNumeric(value: userInputValue) && userSymbol == "") {
        userInput1 = userInput1 + userInputValue;
        calcScreen = calcScreen + userInputValue;
      } else if (checkIfNumeric(value: userInputValue) && userSymbol != "") {
        userInput2 = userInput2 + userInputValue;
        calcScreen = calcScreen + userInputValue;
      } else if (!checkIfNumeric(value: userInputValue) &&
          userSymbol == "" &&
          userInputValue != "C" &&
          userInputValue != "=") {
        userSymbol = userInputValue;
        calcScreen = calcScreen + userInputValue;
      } else if (!checkIfNumeric(value: userInputValue) &&
          userInputValue == "C") {
        userInput1 = "";
        userInput2 = "";
        userSymbol = "";
        calcScreen = "";
      } else if (userInputValue == "=" &&
          userInput1 != "" &&
          userInput2 != "" &&
          userSymbol != "") {
        print("suma");
        if (userSymbol == "+") {
          calcScreen =
              (int.parse(userInput1) + int.parse(userInput2)).toString();
          userInput2 = "";
          userSymbol = "";
          userInput1 = calcScreen;
        } else if (userSymbol == "-") {
          calcScreen =
              (int.parse(userInput1) - int.parse(userInput2)).toString();
          userInput2 = "";
          userSymbol = "";
          userInput1 = calcScreen;
        } else if (userSymbol == "*") {
          calcScreen =
              (int.parse(userInput1) * int.parse(userInput2)).toString();
          userInput2 = "";
          userSymbol = "";
          userInput1 = calcScreen;
        } else if (userSymbol == "/") {
          calcScreen = ((int.parse(userInput1) / int.parse(userInput2)).round())
              .toString();
          userInput2 = "";
          userSymbol = "";
          userInput1 = calcScreen;
        }
      }
    });
  }

  Widget buildKey({required String keyValue}) => TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue[100]),
      ),
      onPressed: () {
        calculate(userInputValue: keyValue);
      },
      child: Container(
        child: Text("$keyValue"),
      )
  );

  Widget buildRowPad(List<String> padNumbers) {
    Widget rowPad = Expanded(
      flex: 1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: buildKey(keyValue: padNumbers[0])),
          Expanded(child: buildKey(keyValue: padNumbers[1])),
          Expanded(child: buildKey(keyValue: padNumbers[2])),
          Expanded(child: buildKey(keyValue: padNumbers[3])),
        ],
      ),
    );

    return rowPad;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            color: Colors.yellow[50],
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "$calcScreen",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 15,
          child: Column(
            children: <Widget>[
              buildRowPad(["9", "8", "7", "+"]),
              buildRowPad(["6", "5", "4", "-"]),
              buildRowPad(["3", "2", "1", "*"]),
              buildRowPad(["0", "=", "C", "/"]),
            ],
          ),
        ),
      ],
    );
  }
}
