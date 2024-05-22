
import 'package:flutter/cupertino.dart';

@immutable
sealed class RmiFetchState {}

final class RmiFetchInitial extends RmiFetchState {}
final class RmiFetchLoading extends RmiFetchState {}
final class RmiFetchSuccess extends RmiFetchState {}
final class RmiFetchError extends RmiFetchState {
  final String message;
  RmiFetchError(this.message);
}
