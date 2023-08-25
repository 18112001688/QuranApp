import 'package:flutter_bloc/flutter_bloc.dart';

part 'sepha_counter_state.dart';

class SephaCounterCubit extends Cubit<int> {
  SephaCounterCubit() : super((0));

  void increment() {
    emit(state + 1);
  }

  void reset() {
    emit(0);
  }
}
