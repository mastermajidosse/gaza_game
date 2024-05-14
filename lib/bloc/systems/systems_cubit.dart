import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/points/points_cubit.dart';
import 'package:gaza/screens/others/levels.dart';
import 'package:gaza/utils/ad_manager.dart';
import 'package:gaza/utils/save.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'systems_state.dart';

class SystemsCubit extends Cubit<SystemsState> {
  SystemsCubit() : super(SystemsInitial());

  DateTime now = DateTime.now();

  int calculateDifference(DateTime date) {
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  refill() async {
    if (Save.life <= 0) emit(SystemsZero());
    int yy = Save.getyear() ?? 2022;
    int mm = Save.getmonth() ?? now.month;
    int dd = Save.getday() ?? now.day - 2;
    // await Save().SetLife(xlife: 10); // 3
    print("object");
    if (calculateDifference(DateTime(yy, mm, dd)) <= -1) {
      print("calculateDifference true");
      await Save().SetLife(xlife: 1000);// here was 3 now is 10
      await Save().Setdaytime(now.day);
      await Save().Setmonthtime(now.month);
      await Save().Setyeartime(now.year);
      Save.life = Save.getLife()!;

      emit(SystemsInitial());
    }
  }

  initiateit() async {
    print("initiateit");

    Save.prefs = await SharedPreferences.getInstance();
    // Save().Setpoint(xpoint: 0); // remove
    // clear();

    int day = await Save.getday() ?? 32;

    int month = await Save.getmonth() ?? 32;

    Save.level = Save.getlevel();
    Save.point = Save.getpoint() ?? 0;
    // Save.life = Save.getLife() ?? 10;
    Save.life = 1000;
    refill();
  }

// add remove

  addlife({lifenum = 100}) {// add 1
    Save().SetLife(xlife: lifenum);
    Save.life = lifenum;
    emit(SystemsHeart(lifenum));
  }

  removeheart(context) async {
    Save().SetLife(xlife: Save.life - 1);
    Save.life -= 1;
    if (Save.life == 1) {
      loadAds();
    }

    emit(SystemsHeart(Save.life));
  }

  void startNewPartyAfterAd() async {
    addlife(lifenum: 300);//3 here
  }

  AdManager? adManager;

  void loadAds() {
    //   // load ads
    //   adManager = AdManager(onUserEarnedReward: startNewPartyAfterAd);
    //   adManager!.loadRewardedAd();
  }

  launchAds(context) {
    // adManager!.showRewardedAd();

    Navigator.pushReplacementNamed(context, LevelScreen.routeName);
  }

  clear() async {
    // clean data
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
