import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gaza/models/points_model.dart';
import 'package:gaza/utils/save.dart';

part 'points_state.dart';

class PointsCubit extends Cubit<PointsState> {
  PointsCubit() : super(PointsState());

  int point = 0;

  String status = "easy";

  PointsModel pointsModel = PointsModel();
  loadPoints() async {
    emit(PointsState(loading: true));
    print("--- loadPoint ---...");
    try {
      point = await Save.getpoint() ?? 0;
      // point = 55;
      // print("--- progress ---..." + getProgressToNxtLvl(point).toString());
      // print("--- nxtlevel ---..." + getReachable(point).toString());
      // print("--- name ---..." + getStatus(point).toString());
      pointsModel = PointsModel(
        points: point,
        progress: getProgressToNxtLvl(point),
        nxtlevel: getReachable(point),
        name: getStatus(point),
      );

      emit(PointsState(loading: false, point: pointsModel));
    } catch (e) {
      emit(PointsState(loading: false, errorMessage: e.toString()));
    }
  }

  addPoints(context, {int x = 6}) async {
    emit(PointsState(loading: true));
    print("object");
    try {
      int point = await Save.getpoint() ?? 0;
      int newpoint = point + x;

      await Save().Setpoint(xpoint: newpoint);
      pointsModel = PointsModel(
        points: newpoint,
        progress: getProgressToNxtLvl(newpoint),
        nxtlevel: getReachable(newpoint),
        name: getStatus(newpoint),
      );
      emit(PointsState(loading: false, point: pointsModel));
    } catch (e) {
      emit(PointsState(loading: false, errorMessage: e.toString()));
    }
  }

  removePoint(int level) async {
    emit(PointsState(loading: true));
    try {
      int point = await Save.getpoint() ?? 0;

      print(minus(level));
      int newpoint = point - minus(level);

      await Save().Setpoint(xpoint: newpoint);
      pointsModel = PointsModel(
        points: newpoint,
        progress: getProgressToNxtLvl(newpoint),
        nxtlevel: getReachable(newpoint),
        name: getStatus(newpoint),
      );
      emit(PointsState(loading: false, point: pointsModel));
    } catch (e) {
      emit(PointsState(errorMessage: e.toString()));
    }
  }

  String getStatus(npoint) {
    // print(npoint);
    if (npoint > 1500) {
      return "legendary";
    } else if (npoint > 90) {
      return "hard";
    } else if (npoint > 30) {
      return "medium";
    }

    return "easy";
  }

  double getProgressToNxtLvl(point) {
    if (point < 30) {
      return (point / 30);
    } else if (point >= 30 && point < 90) {
      return (point / 90);
    } else
      return 1.0;
  }

  int getReachable(int point) {
    if (point < 30) {
      return 30 - point;
    } else if (point >= 30 && point < 90) {
      return 90 - point;
    } else
      return 0;
  }

  Color? colorOFLevel(index) {
    if (index < 6) {
      return Colors.teal[100];
      // why 15 ?? i have to 20
    } else if ((status == "medium" || status == "hard") && index < 15) {
      return Colors.teal[200];
    } else if (status == "hard") {
      return Colors.teal[300];
    } else {
      return Colors.grey;
    }
  }

  int minus(level) {
    // print(level);
    if (level > 15) {
      return 3;
    } else if (level > 6) {
      return 2;
    } else
      return 1;
  }
}
