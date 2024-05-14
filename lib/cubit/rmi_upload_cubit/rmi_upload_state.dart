part of 'rmi_upload_cubit.dart';

@immutable
sealed class RmiUploadState {}

final class RmiUploadInitial extends RmiUploadState {}
final class RmiUploadSuccess extends RmiUploadState {}
final class RmiUploadLoading extends RmiUploadState {}
final class RmiUploadError extends RmiUploadState {
  final String message;
  RmiUploadError(this.message);
}
