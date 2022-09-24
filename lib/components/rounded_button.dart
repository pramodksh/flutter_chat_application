import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  RoundedButton({
    required this.buttonText,
    required this.routeName,
    required this.buttonColor,
  });

  Color buttonColor = Colors.blue;
  String routeName;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: (){
            Navigator.pushNamed(context, routeName);
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText.toString(),
          ),
        ),
      ),
    );
  }
}