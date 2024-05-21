import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/points/points_cubit.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/models/levelQ.dart';
import 'package:collection/collection.dart';

part 'fullanswear_state.dart';

class FullanswearCubit extends Cubit<FullanswearState> {
  FullanswearCubit() : super(FullanswearInitial());

  Random rand = Random();
  int rando = 0;
  String alphabet = "حخهعغغفقثصضكمنتالبيسشةىلارؤءئةوزظذطدج";
  String numbers = "1234567890";
  List letters = [];
  List dislayedAnswer = [];
  List listdislayedAnswer = [];
  List<int> falseplace = [];

  initiate(String response) {
    dislayedAnswer = [];
    listdislayedAnswer = [];
    falseplace = [];
    letters = [];

    dislayedAnswer.length = response.characters.contains(" ") ? response.length : response.length;

    for (var i = 0; i < dislayedAnswer.length; i++) {
      if (response.characters.elementAt(i) != " ") {
        letters.add(response.characters.elementAt(i));
        listdislayedAnswer.add(response.characters.elementAt(i));
      }
    }
    if (num.tryParse(response) is num) {
      for (var i = letters.length; i < 20; i++) {
        rando = rand.nextInt(numbers.length);
        letters.add(numbers.characters.elementAt(rando));
      }
    } else {
      for (var i = letters.length; i < 20; i++) {
        rando = rand.nextInt(alphabet.length);
        letters.add(alphabet.characters.elementAt(rando));
      }
    }
    print(letters.length);
    letters.shuffle();
    emit(FullLoaded(letters, dislayedAnswer));
  }

  addletter(index, charachtr, context, List<LevelM> levelM, int qstnum) {
    emit(FullLoaded(letters, dislayedAnswer));
    // print(letters.length.toString());

    letters.removeAt(index);
    letters.insert(index, "");

    int indexTable = listdislayedAnswer.indexOf(charachtr);
    dislayedAnswer.removeAt(indexTable);
    dislayedAnswer.insert(indexTable, charachtr);
    listdislayedAnswer.removeAt(indexTable);
    listdislayedAnswer.insert(indexTable, "");
    emit(FullLoadedfill(letters, dislayedAnswer, falseplace));
    print(listdislayedAnswer);

    //win
    if (listdislayedAnswer.every((element) => element == "")) {
      win(context, levelM, qstnum);
    }
  }

  removeletter(index, charachtr, context, List<LevelM> levelM, int qstnum) {
    emit(FullLoaded(letters, dislayedAnswer));

    letters.removeAt(index);
    letters.insert(index, "");
    falseplace.add(index);
    emit(FullLoadedfill(letters, dislayedAnswer, falseplace));

    if (falseplace.length > 1) {
      lose(context, levelM, qstnum);
    }
  }

  win(context, levelM, qstnum) {
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      BlocProvider.of<FeedCubit>(context).emit(
        FeedGoodAnswer(levelM, qstnum),
      );
      // BlocProvider.of<PointsCubit>(context).addPoints(context, x: 5);
    });
  }

  lose(context, levelM, qstnum) {
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      BlocProvider.of<FeedCubit>(context).emit(
        FeedfalseAnswer(levelM, qstnum),
      );
      BlocProvider.of<SystemsCubit>(context).removeheart(context);
    });
  }
}
