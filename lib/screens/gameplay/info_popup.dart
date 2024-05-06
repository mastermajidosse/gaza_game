import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/models/levelM.dart';
import 'package:gaza/screens/others/menu.dart';
import 'package:gaza/screens/others/splash.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:gaza/utils/save.dart';

class InfoPopup extends StatelessWidget {
  InfoPopup(
    this.index,
    this.result,
    this.datalevel, {
    this.timeup = false,
  });
  int index;
  List<LevelM> datalevel;
  bool result;
  bool timeup;
  String? qst =
      "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ ";

  @override
  Widget build(BuildContext context) {
    LevelM data = datalevel[index];
    // precacheImage(
    //   NetworkImage(),
    //   context,
    // );
    return BlocBuilder<SystemsCubit, SystemsState>(
      builder: (context, state2) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 36,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  datalevel.length > index + 1
                      ? CachedNetworkImage(
                          imageUrl: datalevel[index + 1].image.toString(),
                          height: 1.h,
                          width: double.infinity,
                          imageBuilder: (context, imageProvider) => Container(
                            color: Colors.amber,
                          ),
                        )
                      : Container(),
                  Expanded(
                      child: Container(
                    color: result ? Mystyle.rightAnswer : Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(result ? Icons.check : Icons.close, color: Colors.white),
                        Text(
                          state2 is SystemsZero
                              ? "خسرت ! جرب مرة اخرى غدا   "
                              : timeup
                                  ? "انتهى الوقت..!"
                                  : result
                                      ? "إجابة صحيحة"
                                      : "إجابة خاطئة",
                          style: Mystyle.truefalsewhite,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(
                        result ? "ممتاز" : data.answers.toString(),
                        style: Mystyle.blackboldtexts,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      child: CachedNetworkImage(
                        imageUrl: data.image.toString(),
                        height: 100.h,
                        width: double.infinity,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 100.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: Container(color: Colors.grey[100])),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Container(
                            height: 58.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "،،",
                                      style: Mystyle.blackboldtexts.copyWith(
                                        color: Colors.transparent,
                                        fontSize: 55,
                                        height: 0.6,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 36,
                                      height: 1,
                                      color: Colors.transparent,
                                    )
                                  ],
                                ),
                                Text(
                                  "هل تعلم؟",
                                  style: Mystyle.blackboldtexts.copyWith(
                                    color: Color.fromARGB(255, 126, 51, 57),
                                    fontSize: ScreenUtil().setSp(22),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 1,
                                      color: Mystyle.coloTxtdarker,
                                    ),
                                    SizedBox(width: 10),
                                    RotatedBox(
                                      quarterTurns: 2,
                                      child: Text(
                                        "،،",
                                        style: Mystyle.blackboldtexts.copyWith(
                                          color: Mystyle.coloTxtdarker,
                                          fontSize: 55,
                                          height: 0.6,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                AutoSizeText(
                                  data.info!,
                                  style: Mystyle.blackboldtexts.copyWith(
                                    fontSize: 15,
                                  ),
                                  minFontSize: 12,
                                  maxLines: 12,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50.h,
                            child: Row(
                              children: [
                                Text(
                                  "،،",
                                  style: Mystyle.blackboldtexts.copyWith(
                                    color: Mystyle.coloTxtdarker,
                                    fontSize: 55,
                                    height: 0.6,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 36,
                                  height: 1,
                                  color: Mystyle.coloTxtdarker,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            state2 is SystemsZero
                                ? Container()
                                : Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        // 7ayed id
                                        // Save()
                                        if (index == datalevel.length - 1) {
                                          popopop(context, data);
                                        } else if (Save.life == 0) {
                                          popopopfail(context);
                                        } else
                                          BlocProvider.of<FeedCubit>(context).nextquestion(
                                            index,
                                            context,
                                          );
                                      },
                                      child: Container(
                                        height: 60.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Mystyle.rightAnswer,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          "مواصلة",
                                          style: Mystyle.whiteboldtexts,
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Menu.routeName);
                              },
                              child: Container(
                                height: 60.h,
                                width: 80.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "اغلاق",
                                  style: Mystyle.smalltxt,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  popopop(context, LevelM data) async {
    return await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            content: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "أكملت المستوى",
                    style: Mystyle.blackboldtexts,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "حصلت على ${data.point(data.difficulty)} نقط واجبت على 10 اسئلة",
                      style: Mystyle.truefalsewhite.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 251,
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // hna nt7assbo
                        BlocProvider.of<FeedCubit>(context).levelDone(context);
                      },
                      style: ElevatedButton.styleFrom(
                          // primary: Mystyle.rightAnswer,
                          ),
                      child: Text(
                        "التالي",
                        style: Mystyle.truefalsewhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  popopopfail(context) async {
    return await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            content: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "انتهت الفرص المتاحة",
                    style: Mystyle.blackboldtexts,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "حصلت على .. نقطة من  ${datalevel.length} سؤال",
                      style: Mystyle.truefalsewhite.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Container(
                  //   width: 251,
                  //   height: 60,
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       BlocProvider.of<SystemsCubit>(context)
                  //           .launchAds(context);
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Mystyle.rightAnswer,
                  //     ),
                  //     child: Text(
                  //       "شاهد لربح 3 فرص جديدة",
                  //       style: Mystyle.truefalsewhite.copyWith(
                  //         fontSize: ScreenUtil().setSp(20),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: 251,
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Splashs.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                          // primary: Colors.black54,
                          ),
                      child: Text(
                        "رجوع للصفحة الأولى",
                        style: Mystyle.truefalsewhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
