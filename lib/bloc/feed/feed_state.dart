part of 'feed_cubit.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class FeedInitial extends FeedState {}

class FeedEmpty extends FeedState {}

class FeedLevelDone extends FeedState {}

class FeedfalseAnswer extends FeedState {
  final List<LevelM> questiondata;

  final int questionNum;
  const FeedfalseAnswer(this.questiondata, this.questionNum);
  @override
  List<Object> get props => [questiondata, questionNum];
}

class FeedGoodAnswer extends FeedState {
  final List<LevelM> questiondata;

  final int questionNum;
  const FeedGoodAnswer(this.questiondata, this.questionNum);
  @override
  List<Object> get props => [questiondata, questionNum];
}

class FeedtimeUp extends FeedState {
  final List<LevelM> questiondata;

  final int questionNum;
  const FeedtimeUp(this.questiondata, this.questionNum);
  @override
  List<Object> get props => [questiondata, questionNum];
}

class Feedreturn extends FeedState {
  final List<LevelM> questiondata;

  final int questionNum;
  const Feedreturn(this.questiondata, this.questionNum);
  @override
  List<Object> get props => [questiondata, questionNum];
}

class FeedLoading extends FeedState {
  const FeedLoading();
  @override
  List<Object> get props => [];
}

class FeedLoaded extends FeedState {
  final List<LevelM> questions;
  final int index;
  final int level;
  final bool help;

  const FeedLoaded(this.questions, this.index, this.level, {this.help = true});
  @override
  List<Object> get props => [questions, index, level, help];
}

class FeedNextSeriesQst extends FeedState {
  const FeedNextSeriesQst();
  @override
  List<Object> get props => [];
}

class FeedshowAds extends FeedState {}

class FeedError extends FeedState {
  final String message;
  const FeedError(this.message);

  @override
  List<Object> get props => [message];
}
