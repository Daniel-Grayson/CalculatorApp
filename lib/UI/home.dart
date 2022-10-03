// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatelessWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Calculator",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: const UI(),
      ),
    );
  }
}

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  // calculator logic

  String result = "";
  String value = "";
  String expression = "";
  String percent = "%";

  buttonPressed(String buttonText) {
    if (value.length > 9) return;
    if (buttonText == "x" && value.isEmpty) return;
    if (buttonText == "-" && value.isEmpty) return;
    if (buttonText == "/" && value.isEmpty) return;
    if (buttonText == "+" && value.isEmpty) return;
    if (buttonText == "%" && value.isEmpty) return;

    setState(() {
      if (buttonText == "." && value.contains(".") ||
          buttonText == "%" && value.contains("%")) {
        // do nothing
      } else if (buttonText == "%" || value.contains("%")) {
        value = value + percent;
        result = buttonText * 2;
      } else if (buttonText == "=") {
        expression = value;
        expression = expression.replaceAll("x", "*");
        expression = expression.replaceAll("/", "/");
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = "${exp.evaluate(EvaluationType.REAL, cm)}";
        } catch (e) {
          result = "Error";
        }
      } else if (buttonText == "+/-") {
        if (value[0] != "-") {
          value = "-" + value;
        } else {
          result = value.substring(1);
        }
      } else {
        if (value == "0" && buttonText != ".") {
          value = buttonText;
        } else {
          value = value + buttonText;
        }
      }
    });
  }

  void ac() => setState(() {
        value = "";
        result = "";
      });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  value,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 100,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  (result).toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        // First Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: () => ac(),
              child: const Text(
                "AC",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              shape: const CircleBorder(),
              color: Colors.grey,
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed('+/-'),
              child: const Text(
                "+/-",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              shape: const CircleBorder(),
              color: Colors.grey,
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed('%'),
              child: const Text(
                "%",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              shape: const CircleBorder(),
              color: Colors.grey,
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed('/'),
              child: const Text(
                "/",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.amberAccent[700],
              padding: const EdgeInsets.all(20),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // Second Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: () => buttonPressed('7'),
              child: const Text(
                "7",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.grey[850],
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed('8'),
              child: const Text(
                "8",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.grey[850],
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed('9'),
              child: const Text(
                "9",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.grey[850],
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed("x"),
              child: const Text(
                "x",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.amberAccent[700],
              padding: const EdgeInsets.all(20),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // Third Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: () => buttonPressed('4'),
              child: const Text(
                "4",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.grey[850],
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed('5'),
              child: const Text(
                "5",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.grey[850],
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed('6'),
              child: const Text(
                "6",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.grey[850],
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed('-'),
              child: const Text(
                "-",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.amberAccent[700],
              padding: const EdgeInsets.all(20),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // Fourth Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: () => buttonPressed('1'),
              child: const Text(
                "1",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.grey[850],
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed('2'),
              child: const Text(
                "2",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.grey[850],
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed('3'),
              child: const Text(
                "3",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.grey[850],
              padding: const EdgeInsets.all(20),
            ),
            RaisedButton(
              onPressed: () => buttonPressed("+"),
              child: const Text(
                "+",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              shape: const CircleBorder(),
              color: Colors.amberAccent[700],
              padding: const EdgeInsets.all(20),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // Fifth Row
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          RaisedButton(
            padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
            onPressed: () => buttonPressed('0'),
            child: const Text(
              "0",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            shape: const StadiumBorder(),
            color: Colors.grey[850],
          ),
          RaisedButton(
            onPressed: () => buttonPressed('.'),
            child: const Text(
              ".",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            shape: const CircleBorder(),
            color: Colors.grey[850],
            padding: const EdgeInsets.all(20),
          ),
          RaisedButton(
            onPressed: () => buttonPressed('='),
            child: const Text(
              "=",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            shape: const CircleBorder(),
            color: Colors.amberAccent[700],
            padding: const EdgeInsets.all(20),
          ),
        ]),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
