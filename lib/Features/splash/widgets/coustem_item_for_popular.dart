import 'package:Qurane_app/core/constant/constent.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.color,
    required this.text,
    required this.image,
    required this.colorTwo,
    required this.onTap,
  });

  final Color color;
  final Color colorTwo;
  final String text;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.42,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [color, colorTwo]),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 90, right: 5),
                    child: Image.asset(
                      image,
                      height: 200,
                      width: 130,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
