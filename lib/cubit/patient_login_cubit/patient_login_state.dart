abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}

class UploadImageSuccess extends LoginState {}

class UploadImageLoading extends LoginState {}
class UploadImageError extends LoginState {}