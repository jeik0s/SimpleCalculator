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
  String _userInputValue1 = "";
  String _userInputValue2 = "";
  String _userMathOperation = "";
  String _result = "0";

  void _getUserInput(String userInput){
    String currently = "";
    if(userInput == "+") {
      _userMathOperation = "+";
      currently = "+";
    }
    else if(userInput == "-") {
      _userMathOperation = "-";
      currently = "-";
      userInput = "";
    }
    else if(userInput == "*"){
      _userMathOperation = "*";
      currently = "*";
      userInput = "";
    }
    else if(userInput == "/"){
      _userMathOperation = "/";
      currently = "/";
      userInput = "";
    }
    else if(userInput == "=") {
      if (_userMathOperation == "+") {
        debugPrint("++++++");
        currently = (int.parse(_userInputValue1) + int.parse(_userInputValue2)).toString();
        _userMathOperation = "=";
      }
      else if (_userMathOperation == "-") {
        debugPrint("-------");
        debugPrint(_userInputValue1 + "-" + _userInputValue2);
        currently = (int.parse(_userInputValue1) - int.parse(_userInputValue2)).toString();
        debugPrint(currently);
        _userMathOperation = "=";
      }
      else if (_userMathOperation == "*") {
        currently = (int.parse(_userInputValue1) * int.parse(_userInputValue2)).toString();
        _userMathOperation = "=";
      }
      else if (_userMathOperation == "/") {
        currently = (int.parse(_userInputValue1) / int.parse(_userInputValue2)).toString();
        _userMathOperation = "=";
      }
    }


    if(_userMathOperation == "") {
      _userInputValue1 = _userInputValue1 + userInput;
      currently = _userInputValue1;
    }
    else if (_userMathOperation != "=") {
      _userInputValue2 = _userInputValue2 + userInput;
      debugPrint("2:" + _userInputValue2);
      currently = _userInputValue2;
    }

    if(userInput == "C"){
      _userInputValue1 = "";
      _userInputValue2 = "";
      _userMathOperation = "";
      currently = "";
    }

    setState(() {
      _result = currently;
    });
  }

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
              ElevatedButton(onPressed: () => _getUserInput("9"), child: KeyButton(buttonName: "9")),
              ElevatedButton(onPressed: () => _getUserInput("8"), child: KeyButton(buttonName: "8")),
              ElevatedButton(onPressed: () => _getUserInput("7"), child: KeyButton(buttonName: "7")),
              ElevatedButton(onPressed: () => _getUserInput("+"), child: KeyButton(buttonName: "+")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: () => _getUserInput("6"), child: KeyButton(buttonName: "6")),
              ElevatedButton(onPressed: () => _getUserInput("5"), child: KeyButton(buttonName: "5")),
              ElevatedButton(onPressed: () => _getUserInput("4"), child: KeyButton(buttonName: "4")),
              ElevatedButton(onPressed: () => _getUserInput("-"), child: KeyButton(buttonName: "-")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: () => _getUserInput("3"), child: KeyButton(buttonName: "3")),
              ElevatedButton(onPressed: () => _getUserInput("2"), child: KeyButton(buttonName: "2")),
              ElevatedButton(onPressed: () => _getUserInput("1"), child: KeyButton(buttonName: "1")),
              ElevatedButton(onPressed: () => _getUserInput("*"), child: KeyButton(buttonName: "*")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: () => _getUserInput("0"), child: KeyButton(buttonName: "0")),
              ElevatedButton(onPressed: () => _getUserInput("="), child: KeyButton(buttonName: "=")),
              ElevatedButton(onPressed: () => _getUserInput("C"), child: KeyButton(buttonName: "C")),
              ElevatedButton(onPressed: () => _getUserInput("/"), child: KeyButton(buttonName: "/")),
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