import 'package:flutter/cupertino.dart';


@immutable
abstract class DoctorRegisterState {}

class DoctorRegisterInitial extends DoctorRegisterState {}
class DoctorRegisterSuccess extends DoctorRegisterState {}
class DoctorRegisterLoading extends DoctorRegisterState {}
class DoctorRegisterError extends DoctorRegisterState {
  final String message;
  DoctorRegisterError(this.message);
}
