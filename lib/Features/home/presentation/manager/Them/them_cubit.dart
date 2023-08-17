import 'package:Qurane_app/Features/home/presentation/manager/Them_prefrences/cubit/them_prefrence_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'them_state.dart';

enum ThemeState { light, dark }

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.light) {
    _init();
  }

  void _init() async {
    bool isDark = await ThemPrefrenceCubit.getTheme();
    emit(isDark ? ThemeState.dark : ThemeState.light);
  }

  void toggleTheme() async {
    bool isDark = state == ThemeState.light;
    await ThemPrefrenceCubit.setTheme(isDark);
    emit(isDark ? ThemeState.dark : ThemeState.light);
  }
}
