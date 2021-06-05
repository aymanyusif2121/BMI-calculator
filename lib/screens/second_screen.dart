import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final double resul;
  final String text;

  SecondScreen(this.resul, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHexColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text(
            'BMI CALCULATION',
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(this.resul.toStringAsFixed(2),
                  style: TextStyle(color: accentHexColor, fontSize: 80)),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  this.text,
                  style: TextStyle(color: accentHexColor, fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Text(
                'Reset',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
