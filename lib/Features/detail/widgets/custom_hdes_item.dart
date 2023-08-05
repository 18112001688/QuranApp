import 'package:flutter/material.dart';

class CustomHdesItem extends StatelessWidget {
  const CustomHdesItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.grey, offset: Offset(0, 4))
            ]),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
              maxLines: null, // allow unlimited number of lines
              overflow: TextOverflow.visible, // allow text to overflow
            ),
          ),
        ),
      ),
    );
  }
}
