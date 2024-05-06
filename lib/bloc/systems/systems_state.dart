part of 'systems_cubit.dart';

abstract class SystemsState extends Equatable {
  const SystemsState();

  @override
  List<Object> get props => [];
}

class SystemsInitial extends SystemsState {}

class SystemsZero extends SystemsState {}

class SystemsHeart extends SystemsState {
  final int life;
  const SystemsHeart(this.life);

  @override
  List<Object> get props => [life];
}

class SystemsLevel extends SystemsState {
  final int level;
  const SystemsLevel(this.level);

  @override
  List<Object> get props => [level];
}

class SystemsPoint extends SystemsState {
  final int point;
  const SystemsPoint(this.point);

  @override
  List<Object> get props => [point];
}
