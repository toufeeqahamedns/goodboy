import 'package:equatable/equatable.dart';

abstract class BaseBlocState extends Equatable{
  const BaseBlocState();

  @override
  List<Object> get props => [];
}

class AppUnintialized extends BaseBlocState {}

class AppInitialized extends BaseBlocState {}

class SomethingWentWrong extends BaseBlocState {}