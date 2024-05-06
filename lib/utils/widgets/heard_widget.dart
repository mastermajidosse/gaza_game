import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:gaza/utils/save.dart';

class Heart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46.w,
      height: 50.w,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/heart.png"),
        ),
      ),
      alignment: Alignment.center,
      child: BlocBuilder<SystemsCubit, SystemsState>(
        builder: (context, state) {
          return Text(
            Save.life.toString(),
            style: Mystyle.blackboldtexts.copyWith(
              fontSize: ScreenUtil().setSp(22),
            ),
          );
        },
      ),
    );
  }
}
