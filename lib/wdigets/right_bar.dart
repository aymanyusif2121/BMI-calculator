import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/app_constants.dart';

class RightBar extends StatelessWidget {
  final double barWidth;

  const RightBar(this.barWidth);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: accentHexColor,
          ),
        )
      ],
    );
  }
}
