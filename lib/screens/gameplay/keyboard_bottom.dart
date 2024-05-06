import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/fullanswear/fullanswear_cubit.dart';
import 'package:gaza/models/levelM.dart';
import 'package:gaza/utils/mystyle.dart';

class CharachtersGameplay extends StatefulWidget {
  const CharachtersGameplay(this.thestate);
  final FeedLoaded thestate;
  @override
  State<CharachtersGameplay> createState() => _CharachtersGameplayState();
}

class _CharachtersGameplayState extends State<CharachtersGameplay> {
  LevelM? qst;
  List<LevelM>? questions;
  int questionIndex = 0;

  @override
  void initState() {
    super.initState();
    qst = widget.thestate.questions[widget.thestate.index];
    questions = widget.thestate.questions;
    questionIndex = widget.thestate.index;

    BlocProvider.of<FullanswearCubit>(context).initiate(qst!.answers!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FullanswearCubit, FullanswearState>(
      builder: (context, state) {
        if (state is FullLoaded) {
          return keyboard(state, context);
        } else if (state is FullLoadedfill) {
          return keyboard(state, context, fp: state.falseplace);
        }
        return Container();
      },
    );
  }

  Directionality keyboard(state, BuildContext context, {List<int>? fp}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
          mainAxisExtent: 77.h,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              // print("keyb");
              if (state.letters[index].toString().isNotEmpty) {
                // print(state.letters[index]);
                if (qst!.answers!.contains(state.letters[index])) {
                  BlocProvider.of<FullanswearCubit>(context)
                      .addletter(index, state.letters[index], context, questions!, questionIndex);
                } else {
                  print(state.letters[index]);
                  BlocProvider.of<FullanswearCubit>(context).removeletter(
                      index, state.letters[index], context, questions!, questionIndex);
                }
              }
            },
            child: Container(
              margin: EdgeInsets.all(1),
              color: fp == null
                  ? Mystyle.colodark.withOpacity(.3)
                  : fp.contains(index)
                      ? Colors.red[900]
                      : Mystyle.colodark.withOpacity(.3),
              alignment: Alignment.center,
              child: Text(
                state.letters[index],
                style: Mystyle.whiteboldtexts.copyWith(
                  fontSize: ScreenUtil().setSp(32),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
