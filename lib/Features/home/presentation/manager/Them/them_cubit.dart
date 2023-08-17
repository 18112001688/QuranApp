import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'them_state.dart';

enum ThemeState { light, dark }

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.light);

  void toggleTheme() {
    emit(state == ThemeState.light ? ThemeState.dark : ThemeState.light);
  }
}
