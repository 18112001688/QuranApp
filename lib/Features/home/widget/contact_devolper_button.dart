import 'package:flutter/material.dart';

class ContactDevlperButton extends StatelessWidget {
  const ContactDevlperButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed,
      required this.buttonColor});

  final String text;
  final Color color;
  final VoidCallback onPressed;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStatePropertyAll(buttonColor)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
