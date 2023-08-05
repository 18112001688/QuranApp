import 'package:Qurane_app/core/constant/constent.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndcaitor extends StatelessWidget {
  const CustomLoadingIndcaitor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      value: 0.5, // Sets the progress value between 0.0 and 1.0
      strokeWidth: 4.0, // Sets the width of the progress indicator's line
      backgroundColor: Colors.grey, // Sets the background color
      valueColor: AlwaysStoppedAnimation<Color>(
          primaryColor), // Sets the progress color
    ));
  }
}
