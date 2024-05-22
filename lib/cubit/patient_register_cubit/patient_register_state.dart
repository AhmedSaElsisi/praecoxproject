
import 'package:flutter/cupertino.dart';

@immutable
abstract class PatientRegisterState {}

class RegisterInitial extends PatientRegisterState {}
class RegisterSuccess extends PatientRegisterState {}
class RegisterLoading extends PatientRegisterState {}
class RegisterError extends  PatientRegisterState{
  final String message;
  RegisterError(this.message);
}
