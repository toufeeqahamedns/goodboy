import 'package:equatable/equatable.dart';

abstract class BaseBlocEvent extends Equatable{
  const BaseBlocEvent();

  @override
  List<Object> get props => [];
}

class InitializeApp extends BaseBlocEvent {
  @override
  String toString() => "AppLaunced";
}