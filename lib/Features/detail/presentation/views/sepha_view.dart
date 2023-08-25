import 'package:Qurane_app/Features/detail/presentation/manager/sepha_cubit/sepha_counter_cubit.dart';
import 'package:Qurane_app/core/constant/constent.dart';
import 'package:Qurane_app/core/utlity/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SephaView extends StatelessWidget {
  const SephaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? primaryColor
              : const Color(0xff180B37),
          title: const Text(
            ' سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى',
            style: TextStyle(fontFamily: 'me_quran'),
          ),
        ),
        body: BlocProvider(
          create: (context) => SephaCounterCubit(),
          child: const SephaViewBody(),
        ));
  }
}

class SephaViewBody extends StatelessWidget {
  const SephaViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SephaCounterCubit, int>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Theme.of(context).brightness == Brightness.light
                    ? Utlity.imageFrame
                    : Utlity.imageDarkFrame,
              ), // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$state ',
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 30,
                    fontFamily: 'me_quran',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<SephaCounterCubit>(context).increment();
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add, // Replace with your desired icon
                        color: Colors.white, // Change the icon color
                        size: 40, // Adjust the icon size
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(primaryColor),
                  ),
                  onPressed: () {
                    BlocProvider.of<SephaCounterCubit>(context).reset();
                  },
                  child: const Text(
                    'ابدء من جديد',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'me_quran',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
