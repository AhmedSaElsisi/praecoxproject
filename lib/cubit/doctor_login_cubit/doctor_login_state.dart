
part of 'doctor_login_cubit.dart';

@immutable
abstract class DoctorLoginState {}

class DoctorLoginInitial extends DoctorLoginState {}
class DoctorLoginSuccess extends DoctorLoginState {}
class DoctorLoginLoading extends DoctorLoginState {}
class DoctorLoginError extends DoctorLoginState {
  final String message;
  DoctorLoginError(this.message);
}