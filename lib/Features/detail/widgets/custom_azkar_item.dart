import 'package:flutter/material.dart';

class CustomAzkarItem extends StatelessWidget {
  const CustomAzkarItem({super.key, required this.azkatItem});
  final String azkatItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[400]
                : const Color(0xff180B37),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.grey, offset: Offset(2, 2))
            ]),
        child: Text(
          azkatItem,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
