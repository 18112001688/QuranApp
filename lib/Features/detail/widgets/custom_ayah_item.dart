import 'package:Qurane_app/core/constant/constent.dart';
import 'package:Qurane_app/core/utlity/images.dart';
import 'package:flutter/material.dart';


class CustomAyahItem extends StatelessWidget {

  
   const CustomAyahItem({
    super.key, required this.surahName, required this.surahNumber, required this.surahVerse, required this.onTap, 
  });

final String surahName;
final int surahNumber;
final String surahVerse;
final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Image.asset(Utlity.imageRecatngle),
            const SizedBox(
              width: 5,
            ),
            Container(
              height: 85,
              width: 318,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      offset: const Offset(0, 5))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                // Image.asset(Utlity.imageMuslim,),
                  Positioned(
                    top: 13,
                    left: 10,
                    right: 0,
                    bottom: 0,
                    child: Text(
                      surahNumber.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 130, top: 10),
                    child: Text(
                      surahName,
                      style: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'me_quran', fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Center(
                      child: Text(
                        surahVerse,
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
