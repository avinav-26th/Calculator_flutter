import 'package:flutter/material.dart';

class calculatorButton extends StatelessWidget {

  final String buttonText;
  final int buttonColor;
  final int textColor;
  final double textSize;
  final Function callBack;

  const calculatorButton({Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.textSize,
    required this.callBack,
}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 3.0),
      child: SizedBox(
        width: 90,
        height: 70,
        child: FlatButton(
          onPressed: () => callBack(buttonText),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: textSize,
            ),),
          color: Color(buttonColor),
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
