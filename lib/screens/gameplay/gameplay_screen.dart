import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/multi/multi_cubit.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/bloc/truefalse/trueorfalse_cubit.dart';
import 'package:gaza/screens/others/levels.dart';
import 'package:gaza/screens/others/menu.dart';
import 'package:gaza/utils/widgets/card_widget.dart';
import 'package:gaza/utils/countdown.dart';
import 'package:gaza/screens/gameplay/pass_help.dart';
import 'package:gaza/utils/widgets/heard_widget.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:gaza/screens/gameplay/info_popup.dart';

class GamePlay extends StatefulWidget {
  static const routeName = 'GamePlay';

  @override
  _GamePlayState createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MultiCubit>(context).clear();
    BlocProvider.of<TrueorfalseCubit>(context).clear();
    BlocProvider.of<FeedCubit>(context).createInter();
  }

  @override
  void dispose() {
    // BlocProvider.of<TrueorfalseCubit>(context).clear();
    super.dispose();
  }

  var scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          decoration: Mystyle.bgdeco(),
          child: BlocBuilder<FeedCubit, FeedState>(
            builder: (context, state) {
              if (state is FeedfalseAnswer) {
                return InfoPopup(
                  state.questionNum,
                  false,
                  state.questiondata,
                );
              } else if (state is FeedGoodAnswer) {
                return InfoPopup(
                  state.questionNum,
                  true,
                  state.questiondata,
                );
              } else if (state is FeedtimeUp) {
                return InfoPopup(
                  state.questionNum,
                  false,
                  state.questiondata,
                  timeup: true,
                );
              }
              return state is FeedLoading
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 53.w,
                              child: IconButton(
                                onPressed: () {
                                  //TODO uncomment this
                                  BlocProvider.of<SystemsCubit>(context).removeheart(context);
                                  popHeart(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            state is FeedLoaded
                                ? Countdown(state.questions, state.index)
                                : Container(),
                            Heart(),
                          ],
                        ),
                        SizedBox(height: 22),
                        state is FeedLoaded
                            ? CardGamePlay(state)
                            : Container(
                                height: 100,
                                width: double.infinity,
                                color: Colors.amber,
                              ),
                        SizedBox(height: 22),
                        state is FeedLoaded ? GameButtom(state, scaffoldKey) : Container(),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }

  popHeart(context) async {
    return await showDialog(
        barrierDismissible: false,
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
                    " للتأكد من اللعب النزيه ",
                    style: Mystyle.blackboldtexts,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "الضغط على رجوع يسبب فقدان فرصة",
                      style: Mystyle.truefalsewhite.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 250,
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LevelScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Mystyle.rightAnswer,
                      ),
                      child: Text(
                        "رجوع",
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
