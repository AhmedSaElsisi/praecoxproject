part of 'layout_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomNacBarState extends HomeState {}
class GetDataLoading extends HomeState {}
class GetDataError extends HomeState {}
class GetDataSuccess extends HomeState {}
