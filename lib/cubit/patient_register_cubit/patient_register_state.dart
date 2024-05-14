
import 'package:flutter/cupertino.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterError extends  RegisterState{
  final String message;
  RegisterError(this.message);
}
class UploadImageSuccess extends RegisterState {}

class UploadImageLoading extends RegisterState {}
class UploadImageError extends RegisterState {}