part of 'ahdes_cubit.dart';


abstract class AhdesState {}

class AhdesInitial extends AhdesState {}

class AhdesisLoading extends AhdesState {}
class AhdesFailure extends AhdesState {
  final String errorMessage;

  AhdesFailure({required this.errorMessage} );
}
class AhdesSuccess extends AhdesState {
 final HdesModel hdesModel;

  AhdesSuccess({required this.hdesModel});
}

