import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/fullanswear/fullanswear_cubit.dart';
import 'package:gaza/bloc/multi/multi_cubit.dart';
import 'package:gaza/bloc/points/points_cubit.dart';
import 'package:gaza/bloc/truefalse/trueorfalse_cubit.dart';
import 'package:gaza/models/levelM.dart';
import 'package:gaza/screens/gameplay/answearone_fill.dart';
import 'package:gaza/screens/gameplay/keyboard_bottom.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:gaza/screens/gameplay/four_answer_gameplay.dart';
import 'package:gaza/screens/gameplay/truefalse_gameplay.dart';

class GameButtom extends StatelessWidget {
  FeedLoaded state;
  GlobalKey<ScaffoldState> scaffoldKey;
  GameButtom(this.state, this.scaffoldKey);
  @override
  Widget build(BuildContext context) {
    final qst = state.questions[state.index];
    return Expanded(
      child: Column(
        children: [
          Expanded(
              flex: state.level % 2 == 0 && qst.type != "one" ? 1 : 2,
              child: Container(
                child: qst.type != "one"
                    ? Container()
                    : BlocBuilder<FullanswearCubit, FullanswearState>(
                        builder: (context, state2) {
                          return state2 is FullLoaded || state2 is FullLoadedfill
                              ? AnswearFilling(qst, state2)
                              : Container();
                        },
                      ),
              )),

          Expanded(
            flex: qst.type == "one"
                ? 1
                : qst.type == "truefalse"
                    ? 2
                    : 3,
            child: Row(children: [
              Expanded(
                child: BlocBuilder<FeedCubit, FeedState>(
                  builder: (context, state3) {
                    if (state3 is FeedLoaded)
                      return GestureDetector(
                        onTap: () {
                          if (qst.type != "truefalse" && state.help == true) {
                            BlocProvider.of<FeedCubit>(context)
                                .removehelp(state.index, qst, scaffoldKey);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: qst.type == "truefalse"
                              ? Mystyle.borderindice(colorop: Colors.black)
                              : state.help == true
                                  ? Mystyle.borderindice()
                                  : Mystyle.borderindice(colorop: Colors.black),
                          child: Text(
                            "مساعدة",
                            style: Mystyle.smalltxtwhite,
                          ),
                        ),
                      );
                    return Container(
                      alignment: Alignment.center,
                      decoration: Mystyle.borderindice(),
                      child: Text(
                        "مساعدة",
                        style: Mystyle.smalltxtwhite,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (BlocProvider.of<MultiCubit>(context).moving) {
                      BlocProvider.of<MultiCubit>(context).Move(
                        state.questions,
                        state.index,
                        context,
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BlocProvider.of<MultiCubit>(context).moving
                        ? Mystyle.borderindice()
                        : Mystyle.borderindice(colorop: Colors.black),
                    child: Text(
                      "تجاوز",
                      style: Mystyle.smalltxtwhite,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          // ,
          // CharachtersWidget(),
          qst.type == "multi"
              ? Expanded(flex: 10, child: FourWidget())
              : qst.type == "one"
                  ? CharachtersGameplay(state) // state.questions
                  : TrueFalse()
        ],
      ),
    );
  }
}
