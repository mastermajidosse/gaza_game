import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/points/points_cubit.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/models/levelQ.dart';

part 'multi_state.dart';

class MultiCubit extends Cubit<MultiState> {
  MultiCubit() : super(MultiInitial());

  question(rando, qst, index) {
    print(rando);
    if (rando == index) {
      return qst.answers.toString();
    } else {
      return qst.falseanswers![index].toString();
    }
  }

  Answert(int rando, int index, List<LevelM> levelM, int questionNum, context) {
    if (rando == index) {
      emit(Multiresult(index));
      win(context, levelM, questionNum);
    } else {
      emit(Multiresultfalse(index));
      lose(context, levelM, questionNum);
    }
  }

  bool moving = true;

  Move(List<LevelM> levelM, int questionNum, context) {
    moving = false;
    emit(Multiresult(7));
    win(context, levelM, questionNum);
  }

  win(context, levelM, questionNum) {
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      BlocProvider.of<FeedCubit>(context).emit(
        FeedGoodAnswer(levelM, questionNum),
      );
      // BlocProvider.of<PointsCubit>(context).addPoints(context);
    });
  }

  lose(context, levelM, questionNum) {
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      BlocProvider.of<FeedCubit>(context).emit(
        FeedfalseAnswer(levelM, questionNum),
      );
      BlocProvider.of<SystemsCubit>(context).removeheart(context);
    });
  }

  clear() {
    emit(MultiInitial());
  }
}
