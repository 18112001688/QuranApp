part of 'azkar_cubit.dart';

abstract class AzkarState {}

class AzkarInitial extends AzkarState {}

class AzkarLoading extends AzkarState {}

class AzkarSuccess extends AzkarState {
  final AzkarData azkarData;

  AzkarSuccess({required this.azkarData});
}

class AzkarFailure extends AzkarState {
  final String errorMessage;

  AzkarFailure({required this.errorMessage});
}
