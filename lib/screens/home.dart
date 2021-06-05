//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/wdigets/left_bar.dart';
import 'package:bmi_calculator/wdigets/right_bar.dart';
import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

TextEditingController _heightEditingController = TextEditingController();
TextEditingController _widthEditingController = TextEditingController();

double result = 0;
String isText = '';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: mainHexColor,
        appBar: AppBar(
          title: Center(
            child: Text(
              'BMI calculator',
              style:
                  TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightEditingController,
                      style: TextStyle(
                          color: accentHexColor,
                          fontSize: 42,
                          fontWeight: FontWeight.w300),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Height',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _widthEditingController,
                      style: TextStyle(
                          color: accentHexColor,
                          fontSize: 42,
                          fontWeight: FontWeight.w300),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Weight',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  double h = double.parse(_heightEditingController.text);
                  double w = double.parse(_widthEditingController.text);
                  setState(() {
                    result = w / (h * h);
                    if (result > 25) {
                      isText = 'you Have over weight';
                    } else if (result >= 18.5 && result <= 25) {
                      isText = 'you Have normal weight';
                    } else {
                      isText = 'you Have under weight';
                    }
                  });
                  _send(context);
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      color: accentHexColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 40),
                ),
              ),
              SizedBox(height: 100),
              LeftBar(70),
              SizedBox(height: 20),
              LeftBar(40),
              SizedBox(height: 20),
              LeftBar(70),
              SizedBox(height: 20),
              RightBar(70),
              SizedBox(height: 20),
              RightBar(70),
            ],
          ),
        ),
      ),
    );
  }

  void _send(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(
            result,
            isText,
          ),
        ));
  }
}
