import 'package:flutter/material.dart';

void main() {
  runApp(SimpleCalculator());
}

class SimpleCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple calculator',
      home: CalculatorCanvas(
        appTitle: 'Simple calculator',
      ),
    );
  }
}

class CalculatorCanvas extends StatefulWidget {
  CalculatorCanvas({Key? key, required this.appTitle}) : super(key: key);

  final String appTitle;
  _CalculatorCanvasState createState() => _CalculatorCanvasState();
}

class _CalculatorCanvasState extends State<CalculatorCanvas> {
  Widget KeyButton({required String buttonName}) => Expanded(
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(1.0),
            color: Colors.blue,
            child: TextButton(
              child: Text(
                buttonName,
                style: TextStyle(fontSize: 30, color: Colors.grey[200]),
              ),
              onPressed: () {
                print("clicked $buttonName");
              },
            )),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: Colors.yellow[200],
                height: 70.0,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      KeyButton(buttonName: "9"),
                      KeyButton(buttonName: "8"),
                      KeyButton(buttonName: "7"),
                      KeyButton(buttonName: "+"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      KeyButton(buttonName: "6"),
                      KeyButton(buttonName: "5"),
                      KeyButton(buttonName: "4"),
                      KeyButton(buttonName: "-"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      KeyButton(buttonName: "3"),
                      KeyButton(buttonName: "2"),
                      KeyButton(buttonName: "1"),
                      KeyButton(buttonName: "*"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      KeyButton(buttonName: "0"),
                      KeyButton(buttonName: "="),
                      KeyButton(buttonName: "C"),
                      KeyButton(buttonName: "/"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
