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

  void showNumber(){
    print('print me');
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 4,
          children: <Widget>[
            KeyButton(buttonName: "9", callback: showNumber),
            KeyButton(buttonName: "8", callback: showNumber),
            KeyButton(buttonName: "7", callback: showNumber),
            KeyButton(buttonName: "+", callback: showNumber),
            KeyButton(buttonName: "6", callback: showNumber),
            KeyButton(buttonName: "5", callback: showNumber),
            KeyButton(buttonName: "4", callback: showNumber),
            KeyButton(buttonName: "-", callback: showNumber),
            KeyButton(buttonName: "3", callback: showNumber),
            KeyButton(buttonName: "2", callback: showNumber),
            KeyButton(buttonName: "1", callback: showNumber),
            KeyButton(buttonName: "*", callback: showNumber),
            KeyButton(buttonName: "0", callback: showNumber),
            KeyButton(buttonName: "=", callback: showNumber),
            KeyButton(buttonName: "C", callback: showNumber),
            KeyButton(buttonName: "/", callback: showNumber),
          ],
        ),
      ),
    );
  }
}

class KeyButton extends StatelessWidget {
  KeyButton({Key? key, required this.buttonName, required this.callback}) : super(key: key);
  final String buttonName;
  final VoidCallback callback;
  // Read https://stackoverflow.com/questions/54493002/pass-method-as-parameter-to-a-widget
  Widget build(BuildContext build) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10.0),
        height: 60.0,
        width: 40.0,
        color: Colors.blue,
        child: TextButton(
          child: Text(
            this.buttonName,
            style: TextStyle(fontSize: 30, color: Colors.grey[200]),
          ),
//        onPressed: () => callback
          onPressed: callback
          ,)
    );
  }
}
