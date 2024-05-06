part of 'multi_cubit.dart';

abstract class MultiState extends Equatable {
  const MultiState();

  @override
  List<Object> get props => [];
}

class MultiInitial extends MultiState {}

class MultiFirst extends MultiState {
  final int random;
  const MultiFirst(this.random);

  @override
  List<Object> get props => [random];
}

class Multiresult extends MultiState {
  final int ind;
  const Multiresult(this.ind);

  @override
  List<Object> get props => [ind];
}

class Multiresultfalse extends MultiState {
  final int ind;
  const Multiresultfalse(this.ind);

  @override
  List<Object> get props => [ind];
}

class MultiresultPass extends MultiState {
  final int ind;
  const MultiresultPass(this.ind);

  @override
  List<Object> get props => [ind];
}
