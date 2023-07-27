import 'package:flutter/material.dart';

import '../costants/constants.dart';
import '../utils/commons.dart';
import 'global_widgets.dart';

class BuyOrSellBox extends StatelessWidget {
  final List<Color> gradientColor;
  final String text;
  final String buttonText;
  final Color buttonColor;
  final Color buttonFontColor;
  final Color textColor;
  const BuyOrSellBox({
    required this.buttonColor,
    required this.buttonFontColor,
    required this.buttonText,
    required this.gradientColor,
    required this.text,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width * 0.88 / 2,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: gradientColor,
        ),
      ),
      child: Column(
        children: [
          OruText(
            text: text,
            fontSize: 16,
            fontColor: textColor,
            fontWeight: FontWeight.bold,
          ),
          verticalMargin12,
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: OruText(
                    text: buttonText,
                    fontWeight: FontWeight.bold,
                    fontColor: buttonFontColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
