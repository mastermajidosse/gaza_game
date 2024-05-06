part of 'more_cubit.dart';

@immutable
abstract class MoreState extends Equatable {
  const MoreState();

  @override
  List<Object> get props => [];
}

class MoreInitial extends MoreState {}

class MoreLoaded extends MoreState {
  final List<Games> allgame;
  const MoreLoaded(
    this.allgame,
  );
  @override
  List<Object> get props => [allgame];
}

class MoreLoading extends MoreState {
  const MoreLoading();
  @override
  List<Object> get props => [];
}

class MoreError extends MoreState {
  final String message;
  const MoreError(this.message);

  @override
  List<Object> get props => [message];
}
