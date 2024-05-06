import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/fullanswear/fullanswear_cubit.dart';
import 'package:gaza/models/levelM.dart';
import 'package:gaza/utils/mystyle.dart';

class AnswearFilling extends StatelessWidget {
  LevelM qst;
  var state2;
  AnswearFilling(this.qst, this.state2);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: num.tryParse(qst.answers!) is num ? TextDirection.ltr : TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(qst.answers!.split(" ")[0].length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: 30.0 - qst.answers!.split(" ")[0].length,
                height: 50.0 - qst.answers!.split(" ")[0].length,
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          state2.place != null && Mystyle.isNullEmptyOrFalse(state2.place[index])
                              ? BorderSide(
                                  color: Colors.white,
                                  width: 5.0,
                                )
                              : BorderSide.none),
                ),
                alignment: Alignment.center,
                child: Text(
                  state2.place[index] ?? "",
                  style: Mystyle.whiteboldtexts.copyWith(
                    fontSize: ScreenUtil().setSp(32),
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }),
          ),
          qst.answers!.contains(" ")
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(qst.answers!.split(" ")[1].length, (index) {
                    int ind = qst.answers!.split(" ")[0].length + index;
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: 35.0 - qst.answers!.split(" ")[1].length,
                      height: 50.0 - qst.answers!.split(" ")[1].length,
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 5.0,
                        ),
                      )),
                      child: Text(
                        state2.place == null ? "" : state2.place[ind] ?? "",
                        style: Mystyle.whiteboldtexts.copyWith(
                          fontSize: ScreenUtil().setSp(32),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }),
                )
              : Container(),
        ],
      ),
    );
  }
}
