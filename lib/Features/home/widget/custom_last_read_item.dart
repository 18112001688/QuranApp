import 'package:Qurane_app/core/utlity/images.dart';
import 'package:flutter/material.dart';

class CustomLastReadItem extends StatelessWidget {
  const CustomLastReadItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.94,
        height: MediaQuery.of(context).size.height * 0.173,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xffDF98FA),
            Color(0xff994EF8),
          ]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(children: [
          Positioned(
            left: 10,
            top: 27,
            child: Image.asset(
              Utlity.imageGroup,
              height: 25,
              width: 25,
            ),
          ),
          const Positioned(
            left: 40,
            top: 30,
            child: Text(
              'Last Read',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            left: 13,
            top: 60,
            child: Text(
              'Al-Fatiah',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Positioned(
            left: 13,
            top: 95,
            child: Text(
              'Ayah No: 1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Positioned(
              left: 175,
              child: Image.asset(
                Utlity.imagefive,
                height: 160,
                width: 160,
              ))
        ]),
      ),
    );
  }
}
