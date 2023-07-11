import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(TipCalculatorApp());
}

class TipCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Tip Calculator',
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.purple),
      home: TipCalculatorScreen(),
    );
  }
}

class TipCalculatorScreen extends StatefulWidget {
  @override
  _TipCalculatorScreenState createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  double billAmount = 0.0;
  double tipPercentage = 0.15;
  double tipAmount = 0.0;

  void calculateTip() {
    setState(() {
      tipAmount = billAmount * tipPercentage;
    });
  }

  void generateRandomTip() {
    setState(() {
      final random = Random();
      tipPercentage = random.nextDouble();
      tipAmount = billAmount * tipPercentage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Tip Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bill Amount: \$${billAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Tip Percentage: ${(tipPercentage * 100).toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Tip Amount: \$${tipAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateTip,
              child: Text('Calculate Tip'),
            ),
            ElevatedButton(
              onPressed: generateRandomTip,
              child: Text('Generate Random Tip'),
            ),
          ],
        ),
      ),
    );
  }
}
