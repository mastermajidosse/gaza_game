part of 'fullanswear_cubit.dart';

abstract class FullanswearState extends Equatable {
  const FullanswearState();

  @override
  List<Object> get props => [];
}

class FullanswearInitial extends FullanswearState {}

class FullLoaded extends FullanswearState {
  final List letters;
  final List place;
  const FullLoaded(this.letters, this.place);
  @override
  List<Object> get props => [letters, place];
}

class FullLoadedfill extends FullanswearState {
  final List letters;
  final List place;
  final List<int> falseplace;
  const FullLoadedfill(this.letters, this.place, this.falseplace);
  @override
  List<Object> get props => [letters, place, this.falseplace];
}

class Fullresultright extends FullanswearState {
  // final int ind;
  // const Fullresultright(this.ind);

  // @override
  // List<Object> get props => [ind];
}

class Fullresultfalse extends FullanswearState {
  // final int ind;
  // const Fullresultfalse(this.ind);

  // @override
  // List<Object> get props => [ind];
}
