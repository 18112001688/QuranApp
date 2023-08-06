import 'package:Qurane_app/Features/home/presentation/manager/cubit/last_read_ayah_cubit.dart';
import 'package:Qurane_app/core/utlity/arabic_numbers.dart';
import 'package:Qurane_app/core/utlity/custom_error_widget.dart';
import 'package:Qurane_app/core/utlity/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLastReadItem extends StatelessWidget {
  const CustomLastReadItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastReadAyahCubit, LastReadAyahState>(
      builder: (context, state) {
        if (state is LastReadAyahSuccess) {
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
                    'أخر ما تم قرأته',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'me_quran'),
                  ),
                ),
                Positioned(
                  left: 13,
                  top: 60,
                  child: Text(
                    state.surahName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'me_quran'),
                  ),
                ),
                Positioned(
                  left: 13,
                  top: 95,
                  child: Text(
                    "رقم السوره:   ${state.ayahNumber}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'me_quran'),
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
        } else {
          return const CoustemErrorWidget(errorMessage: 'No Ayah Found');
        }
      },
    );
  }
}
