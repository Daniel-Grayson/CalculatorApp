// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

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
  String result = "0";
  String value = "0";

  pressOne(String number) {
    setState(() {
      // if (value.length > 3) {
      //   // do nothing
      // }
      if (number == "." && value.contains(".")) {
        // do nothing
      } else if (number == "=") {
        // do nothing
      } else {
        if (value == "0" && number != ".") {
          value = number;
        } else {
          value = value + number;
        }
      }
    });
  }

  // void pressOne(String number) {
  //   if (value.length > 8) return;
  //   if (number == "." && value.contains(".")) return;
  //   setState(() => (value == "0" && number != ".")
  //       ? value = number
  //       : value = value += number);
  // }

  void ac() => setState(() => value = "0");
  // void add() => setState(() {
  //   int.parse(numOne) + int.parse(numTwo);
  //   result = add();
  //   total = result.toString();
  //       // numOne + numTwo;
  //     });

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
                    fontSize: 90,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ))
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
              onPressed: () {},
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
              onPressed: () {},
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
              onPressed: () {},
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
              onPressed: () => pressOne('7'),
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
              onPressed: () => pressOne('8'),
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
              onPressed: () => pressOne('9'),
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
              onPressed: () {},
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
              onPressed: () => pressOne('4'),
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
              onPressed: () => pressOne('5'),
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
              onPressed: () => pressOne('6'),
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
              onPressed: () {},
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
              onPressed: () => pressOne('1'),
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
              onPressed: () => pressOne('2'),
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
              onPressed: () => pressOne('3'),
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
              onPressed: () => pressOne("+"),
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
            onPressed: () => pressOne('0'),
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
            onPressed: () => pressOne('.'),
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
            onPressed: () {},
            // => add(),
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
