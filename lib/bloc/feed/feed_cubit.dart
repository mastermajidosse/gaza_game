import 'dart:math';

import 'package:equatable/equatable.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/fullanswear/fullanswear_cubit.dart';
import 'package:gaza/bloc/multi/multi_cubit.dart';
import 'package:gaza/bloc/points/points_cubit.dart';
import 'package:gaza/bloc/truefalse/trueorfalse_cubit.dart';
import 'package:gaza/models/levelM.dart';
import 'package:gaza/screens/others/levels.dart';
import 'package:gaza/services/getdata.dart';
import 'package:gaza/utils/admob.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:gaza/utils/save.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedInitial());

  int muchTime = 0;
  int index = 0;
  List<LevelM>? qstleveltd;
  Getdata getdata = Getdata();
  int levelnum = 0;
  int rando = 0;

  bool userData = false;

  increseMuch() {
    print("muchTime" + muchTime.toString());
    if (muchTime >= 2) {
      emit(FeedshowAds());
    } else {
      muchTime++;
      emit(FeedInitial());
    }
  }

  createInter() {
    //   if (muchTime == 1)
    //     Ads().createInterstitialAd();
    //   else
    //     print("Not yet" + muchTime.toString());
  }

  aZero(context, dare, truth) {
    muchTime = 1;
    emit(FeedInitial());
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Choose(
    //       dares: dare!,
    //       turths: truth!,
    //     ),
    //   ),
    // );
  }

  Future getQuestions(int levelM) async {
    emit(FeedLoading());

    levelnum = levelM;
    print("level number is " + levelnum.toString());

    try {
      print("try");

      qstleveltd = await getdata.fetchQuestions(levelM);
      // print("print emit => $levelM");

      emit(FeedLoaded(qstleveltd!, index, levelM));
    } catch (e) {
      emit(FeedError(e.toString()));
    }
  }

  nextquestion(index, context) {
    BlocProvider.of<MultiCubit>(context).clear();
    BlocProvider.of<TrueorfalseCubit>(context).clear();
    help = true;
    emit(FeedLoaded(qstleveltd!, index + 1, levelnum, help: true));
  }

  levelDone(context) async {
    // bloc add point ..
    BlocProvider.of<MultiCubit>(context).moving = true;
    help = true;
    print(" levelnum is $levelnum");
    levelpoints(context);
    List<String>? level = await Save.getlevel();
    level.add(levelnum.toString());
    Save().Setlevel(xlevel: level);
    Navigator.pushReplacementNamed(context, LevelScreen.routeName);
  }

  levelpoints(context) {
    print(" levelnum  $levelnum");

    if (levelnum < 7) {
      BlocProvider.of<PointsCubit>(context).addPoints(context, x: 5);
    } else if (levelnum < 16) {
      BlocProvider.of<PointsCubit>(context).addPoints(context, x: 15);
    } else {
      BlocProvider.of<PointsCubit>(context).addPoints(context, x: 20);
    }
  }

  initGame() {
    index = 0;
  }

  bool help = true;

  removehelp(index, qst, scaffoldKey) async {
    emit(FeedLoading());
    try {
      if (qst.type == "one") {
        if (qst.answers!.length > 3) {
          Mystyle.snackb(
              scaffoldKey, qst.answers!.substring(0, (qst.answers!.length / 3).toInt()).toString());
        } else {
          Mystyle.snackb(scaffoldKey, "لا توجد مساعدة الحروف اقل من تلاتة");
        }
      } else {
        qstleveltd![index].falseanswers!.replaceRange(1, 2, [""]);
      }
      help = false;
      // print("help1");
      emit(FeedLoaded(qstleveltd!, index, levelnum, help: false));
    } catch (e) {
      emit(FeedError(e.toString()));
    }
  }
}
