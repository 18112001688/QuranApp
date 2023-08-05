import 'package:Qurane_app/Features/detail/data/models/ahdes_model/hdes_model.dart';
import 'package:Qurane_app/Features/detail/data/repos/ahdes_repos/ahdes_repo_imp.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'ahdes_state.dart';

class AhdesCubit extends Cubit<AhdesState> {
  AhdesCubit({required this.ahdesRepoImp}) : super(AhdesInitial());

  final AhdesRepoImp ahdesRepoImp;

  Future<void> fetchAhdesData() async {
    emit(AhdesisLoading());
    var result = await ahdesRepoImp.fetchAhdesData();
    result.fold((failure) {
      emit(AhdesFailure(errorMessage: failure.toString()));
    }, (ahdes) {
      emit(
        AhdesSuccess(hdesModel: ahdes),
      );
    });
  }
}
