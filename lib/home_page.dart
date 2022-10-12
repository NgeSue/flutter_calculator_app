import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = "0"; // output text
  String _output = '0'; // accept input var
  String operator = '';
  double num1 = 0;
  double num2 = 0;

  btnPressed(String btnText) {
    if (btnText == "CLEAR") {
      _output = '0';
      operator = '';
      num1 = 0;
      num2 = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "*" ||
        btnText == "/") {
      num1 = double.parse(output);
      operator = btnText;
      _output = "0";
    } else if (btnText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + btnText;
      }
    } else if (btnText == "=") {
      num2 = double.parse(output);

      switch (operator) {
        case "+":
          _output = (num1 + num2).toString();
          break;
        case "-":
          _output = (num1 - num2).toString();
          break;
        case "*":
          _output = (num1 * num2).toString();
          break;
        case "/":
          _output = (num1 / num2).toString();
          break;
      }

      num1 = 0;
      num2 = 0;
      operator = "";
    } else {
      _output = _output + btnText;
    }
    // print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget numBtn(String btnText) {
    return Expanded(
        child: OutlinedButton(
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(400, 100), maximumSize: const Size(400, 100)),
      onPressed: () => btnPressed(btnText),
      child: Text(btnText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          child: Text(
            output,
            style: const TextStyle(
                fontSize: 100,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          height: 10,
        ),

        // BUTTONS

        Column(
          children: [
            Row(
              children: [
                numBtn("7"),
                numBtn("8"),
                numBtn("9"),
                numBtn("/"),
              ],
            ),
            Row(
              children: [
                numBtn("6"),
                numBtn("5"),
                numBtn("4"),
                numBtn("*"),
              ],
            ),
            Row(
              children: [
                numBtn("3"),
                numBtn("2"),
                numBtn("1"),
                numBtn("-"),
              ],
            ),
            Row(
              children: [
                numBtn("."),
                numBtn("0"),
                numBtn("00"),
                numBtn("+"),
              ],
            ),
            Row(
              children: [
                numBtn("CLEAR"),
                numBtn("="),
              ],
            )
          ],
        )
      ]),
    );
  }
}
