import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/multi/multi_cubit.dart';
import 'package:gaza/models/levelM.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:gaza/screens/gameplay/info_popup.dart';

class FourWidget extends StatefulWidget {
  @override
  State<FourWidget> createState() => _FourWidgetState();
}

class _FourWidgetState extends State<FourWidget> {
  Random rand = Random();
  int rando = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rando = rand.nextInt(4);
    // print(rando);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      builder: (context, state) {
        if (state is FeedLoaded) {
          final qst = state.questions[state.index];
          return BlocBuilder<MultiCubit, MultiState>(
            builder: (context, state2) {
              return Container(
                  height: state.level % 2 != 0 ? 245.h : 200.h,
                  width: double.infinity,
                  child: Column(
                      children: List.generate(4, (index) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (state2 is MultiInitial) {
                            BlocProvider.of<MultiCubit>(context).Answert(
                              rando,
                              index,
                              state.questions,
                              state.index,
                              context,
                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: state2 is Multiresult
                              ? Mystyle.borderwhiteResponse(index: state2.ind == index ? 1 : 0)
                              : state2 is Multiresultfalse
                                  ? Mystyle.borderwhiteResponse(
                                      index: state2.ind == index ? 2 : 0,
                                    )
                                  : Mystyle.borderwhiteResponse(index: 0),
                          child: Text(
                            rando == index
                                ? qst.answers.toString()
                                : rando < index
                                    ? qst.falseanswers![index - 1].toString()
                                    : qst.falseanswers![index].toString(),
                            style: Mystyle.truefalsewhite,
                          ),
                        ),
                      ),
                    );
                  }))
                  // : Wrap(
                  //     children: List.generate(
                  //       4,
                  //       (index) {
                  //         return Container(
                  //           width: ScreenUtil().screenWidth / 2,
                  //           // height: 100,
                  //           child: GestureDetector(
                  //             onTap: () {
                  //               if (state2 is MultiInitial) {
                  //                 BlocProvider.of<MultiCubit>(context)
                  //                     .Answert(
                  //                   rando,
                  //                   index,
                  //                   state.questions,
                  //                   state.index,
                  //                   context,
                  //                 );
                  //               }
                  //             },
                  //             child: Container(
                  //               alignment: Alignment.center,
                  //               decoration: state2 is Multiresult
                  //                   ? Mystyle.borderwhiteResponse(
                  //                       index: state2.ind == index ? 1 : 0)
                  //                   : state2 is Multiresultfalse
                  //                       ? Mystyle.borderwhiteResponse(
                  //                           index:
                  //                               state2.ind == index ? 2 : 0,
                  //                         )
                  //                       : Mystyle.borderwhiteResponse(
                  //                           index: 0),
                  //               child: Text(
                  //                 // indexing(qst, index).toString(),
                  //                 rando == index
                  //                     ? qst.answers.toString()
                  //                     : rando < index
                  //                         ? qst.falseanswers![index - 1]
                  //                             .toString()
                  //                         : qst.falseanswers![index]
                  //                             .toString(),
                  //                 style: Mystyle.truefalsewhite,
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  );
            },
          );
        }
        return Container();
      },
    );
  }
}
