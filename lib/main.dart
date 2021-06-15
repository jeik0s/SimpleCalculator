import 'package:flutter/material.dart';

void main() {
  runApp(SimpleCalculator());
}

class SimpleCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: CalculatorCanvas()
        ),
      ),
    );
  }
}

class CalculatorCanvas extends StatefulWidget {
  @override
  _CalculatorCanvasState createState() => _CalculatorCanvasState();
}

class _CalculatorCanvasState extends State<CalculatorCanvas> {

  Widget buildKey({required String keyValue})
  => Expanded(
    child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue[200]),
        ),
        onPressed: () {},
        child: Container(
          child: Text("$keyValue"),
        )
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: Colors.yellow[50],
          ),
        ),
        Expanded(
          flex: 10,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildKey(keyValue: "9"),
                  buildKey(keyValue: "8"),
                  buildKey(keyValue: "7"),
                  buildKey(keyValue: "+"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
