import 'package:Qurane_app/Features/detail/data/models/azkar_model/azkar_data.dart';
import 'package:Qurane_app/Features/detail/data/repos/Azkar_repos/azkar_repo_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit({required this.azkarRepoImp}) : super(AzkarInitial());

  final AzkarRepoImp azkarRepoImp;

  Future<void> fetchAzkarData() async {
    emit(AzkarLoading());
    var result = await azkarRepoImp.fetchAzkarData();

    result.fold((failure) {
      emit(AzkarFailure(errorMessage: failure.toString()));
    }, (azkar) {
      emit(
        AzkarSuccess(azkarData: azkar),
      );
    });
  }
}
