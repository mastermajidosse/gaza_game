import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/models/levelQ.dart';
import 'package:gaza/utils/mystyle.dart';

class Countdown extends StatefulWidget {
  List<LevelM> questions;
  int index;

  Countdown(this.questions, this.index);

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 31,
      initialDuration: 0,
      controller: CountDownController(),
      width: 46.w,
      height: 46.w,
      ringColor: Mystyle.colotarikh,
      ringGradient: null,
      fillColor: Mystyle.secondrycolo,
      fillGradient: null,
      backgroundColor: Colors.transparent,
      backgroundGradient: null,
      strokeWidth: 5.w,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: () {
        BlocProvider.of<SystemsCubit>(context).removeheart(context);
        BlocProvider.of<FeedCubit>(context).emit(
          FeedtimeUp(widget.questions, widget.index),
        );
        // Feedreturn
      },
    );
  }
}
