import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/truefalse/trueorfalse_cubit.dart';
import 'package:gaza/utils/mystyle.dart';

class TrueFalse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      builder: (context, state) {
        if (state is FeedLoaded) {
          return Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<TrueorfalseCubit, TrueorfalseState>(
                    builder: (context, state2) {
                      return GestureDetector(
                        onTap: () {
                          if (state2 is TrueorfalseInitial) {
                            BlocProvider.of<TrueorfalseCubit>(context).Answert(
                              state.questions,
                              context,
                              index: state.index,
                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: state2 is Trueorfalseresult
                              ? Mystyle.borderwhiteResponse(index: state2.ttt)
                              : Mystyle.borderwhiteResponse(index: 0),
                          child: Text(
                            "صحيح",
                            style: Mystyle.truefalsewhite,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<TrueorfalseCubit, TrueorfalseState>(
                    builder: (context, state2) {
                      return GestureDetector(
                        onTap: () {
                          if (state2 is TrueorfalseInitial) {
                            BlocProvider.of<TrueorfalseCubit>(context).AnswerF(
                              state.questions,
                              context,
                              index: state.index,
                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: state2 is Trueorfalseresult
                              ? Mystyle.borderwhiteResponse(index: state2.fff)
                              : Mystyle.borderwhiteResponse(index: 0),
                          child: Text(
                            "خطأ",
                            style: Mystyle.truefalsewhite,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
