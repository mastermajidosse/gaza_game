part of 'trueorfalse_cubit.dart';

abstract class TrueorfalseState extends Equatable {
  const TrueorfalseState();

  @override
  List<Object> get props => [];
}

class TrueorfalseInitial extends TrueorfalseState {}

class Trueorfalseresult extends TrueorfalseState {
  final int fff;
  final int ttt;
  const Trueorfalseresult(this.fff, this.ttt);

  @override
  List<Object> get props => [fff, ttt];
}
