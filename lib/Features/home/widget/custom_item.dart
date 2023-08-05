import 'package:Qurane_app/core/constant/constent.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem(
      {super.key,
      required this.firstColor,
      required this.text,
      required this.onTap,
      required this.image});
  final Color firstColor;
  final String text;
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              firstColor,
              Colors.white,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 20,
              right: 35,
              child: Text(
                text,
                style: const TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontFamily: 'me_quran',
                    fontWeight: FontWeight.w800),
              ),
            ),
            Positioned(
              top: 60,
              left: 30,
              child: Image.asset(
                image,
                height: 150,
                width: 120,
              ),
            )
          ],
        ),
      ),
    );
  }
}
