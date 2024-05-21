import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/points/points_cubit.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/models/levelQ.dart';

part 'trueorfalse_state.dart';

class TrueorfalseCubit extends Cubit<TrueorfalseState> {
  TrueorfalseCubit() : super(TrueorfalseInitial());

  int tru = 0;
  int fal = 0;

  Answert(List<LevelM> levelM, context, {int index = 0}) {
    if (levelM[index].answers == "true") {
      tru = 1;
      Future.delayed(Duration(seconds: 1)).whenComplete(() {
        BlocProvider.of<FeedCubit>(context).emit(
          FeedGoodAnswer(levelM, index),
        );
        // BlocProvider.of<PointsCubit>(context).addPoints(context);
      });
    } else {
      tru = 2;

      Future.delayed(Duration(seconds: 1)).whenComplete(() {
        BlocProvider.of<FeedCubit>(context).emit(
          FeedfalseAnswer(levelM, index),
        );
        BlocProvider.of<SystemsCubit>(context).removeheart(context);
      });
    }
    emit(Trueorfalseresult(0, tru));
  }

  AnswerF(List<LevelM> levelM, context, {int index = 0}) {
    print("fal1");
    if (levelM[index].answers == "false") {
      print("fal");
      fal = 1;
      Future.delayed(Duration(seconds: 1)).whenComplete(() {
        BlocProvider.of<FeedCubit>(context).emit(
          FeedGoodAnswer(levelM, index),
        );
        // BlocProvider.of<PointsCubit>(context).addPoints(context);
      });
    } else {
      fal = 2;
      Future.delayed(Duration(seconds: 1)).whenComplete(() {
        BlocProvider.of<FeedCubit>(context).emit(
          FeedfalseAnswer(levelM, index),
        );
        BlocProvider.of<SystemsCubit>(context).removeheart(context);
      });
    }
    emit(Trueorfalseresult(fal, 0));
  }

  clear() {
    emit(TrueorfalseInitial());
  }
}
