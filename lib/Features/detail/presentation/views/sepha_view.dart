import 'package:Qurane_app/Features/detail/presentation/manager/sepha_cubit/sepha_counter_cubit.dart';
import 'package:Qurane_app/Features/detail/widgets/custom_sepha_widget.dart';
import 'package:Qurane_app/core/constant/constent.dart';
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
