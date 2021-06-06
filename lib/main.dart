import 'package:flutter/material.dart';

void main() {
  runApp(SimpleCalculator());
}

class SimpleCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Simple calculator',
      home: CalculatorCanvas(appTitle: 'Simple calculator',),
    );
  }
}

class CalculatorCanvas extends StatefulWidget {
  CalculatorCanvas({Key? key, required this.appTitle}) : super(key: key);

  final String appTitle;
  _CalculatorCanvasState createState() => _CalculatorCanvasState();
}

class _CalculatorCanvasState extends State<CalculatorCanvas> {
  int _userInputValue1 = 0;
  int _userInputValue2 = 0;
  String _userMathOperation = "+";
  int _result = 0;

  void _showClickedValue(){
    setState(() {
      _result = 9;
    });
  }

//  void _addValues(){
////    _result = _userInputValue1 + _userInputValue2;
////  }
////
////  void _subtractValues(){
////    _result = _userInputValue1 - _userInputValue2;
////  }
////
////  void _multiplyValues(){
////    _result = _userInputValue1 * _userInputValue2;
////  }
////
//////  void _divideValues(){
//////    _result = _userInputValue1 / _userInputValue2;
//////  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.amber[600],
            height: 70.0,
            child: Text('$_result',
              style: Theme.of(context).textTheme.headline4,
            ),
            alignment: Alignment.centerRight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "9")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "8")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "7")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "+")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "6")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "5")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "4")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "-")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "3")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "2")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "1")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "*")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "0")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "=")),
              ElevatedButton(onPressed: _showClickedValue, child: KeyButton(buttonName: "/")),
            ],
          ),

        ],
      ),
    );
  }

}

class KeyButton extends StatelessWidget {
  KeyButton({Key? key, required this.buttonName}) : super(key: key);
  final String buttonName;

  Widget build(BuildContext build){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10.0),
      height: 60.0,
      width: 40.0,
      child: Text(this.buttonName,
          style: TextStyle( fontSize: 30)
      ),
    );
  }
}