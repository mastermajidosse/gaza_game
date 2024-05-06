import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/points/points_cubit.dart';
import 'package:gaza/screens/gameplay/gameplay_screen.dart';
import 'package:gaza/screens/others/menu.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:gaza/utils/save.dart';
import 'package:gaza/utils/widgets/heard_widget.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen();
  static const routeName = 'LevelScreen';

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  List<String> lvlNames = [
    "الأول",
    "التاني",
    "التالت",
    "الرابع",
    "الخامس",
    "السادس",
    "السابع",
    "التامن",
    "التاسع",
    "العاشر",
    "الحادي عشر",
    "التاني عشر",
    "التالت عشر",
    "الرابع عشر",
    "الخامس عشر",
    "السادس عشر",
    "السابع عشر",
    "التامن عشر",
    "التاسع عشر",
    "العشرون",
    "الواحد والعشرون",
    "التاني والعشرون",
    "التالت والعشرون",
    "الرابع والعشرون",
    "الخامس والعشرون",
    "السادس والعشرون",
    "السابع والعشرون",
    "التامن والعشرون",
    "التاسع والعشرون",
    "التلاتون",
  ];

  @override
  void initState() {
    super.initState();
  }

  // String status = "hard";
  int isx = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointsCubit, PointsState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color.fromARGB(255, 255, 241, 211),
            // backgroundColor: Color.fromARGB(255, 245, 240, 228),rgb()
            appBar: AppBar(
              backgroundColor: Mystyle.colodark,
              elevation: 1.0,
              leading: BackButton(
                color: Mystyle.textlighColo,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(),
                    ),
                  );
                },
              ),
              title: Text("اختر المستوى", style: Mystyle.moretitleTextStyle),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Heart(),
                ),
              ],
            ),
            body: state is PointsLoaded
                ? Container(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: List.generate(lvlNames.length, (index) {
                        return InkWell(
                          onTap: () {
                            print(index);
                            if (Save.getlevel().contains((index + 1).toString())) {
                              Mystyle.snackb(scaffoldKey, "لا يمكن لعب المستوى اكتر من مرة");
                              return null;
                            }
                            if (Save.life <= 0) {
                              Mystyle.snackb(scaffoldKey, "ليس لديك فرص متبقية");
                              return null;
                            }
                            if (index > 14) {
                              print("hard .. " + state.point.points.toString());
                              if (state.point.points! > 90) {
                                // hard
                                BlocProvider.of<FeedCubit>(context)
                                    .getQuestions(index + 1)
                                    .then((value) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GamePlay(),
                                    ),
                                  );
                                });
                              } else {
                                Mystyle.snackb(scaffoldKey, " نقط اكتر للعب هدا المستوى");
                                return null;
                              }
                            } else if (index > 5 && index < 15) {
                              print("stat .. " + state.point.points.toString());
                              if (state.point.points! > 30) {
                                //medium
                                BlocProvider.of<FeedCubit>(context)
                                    .getQuestions(index + 1)
                                    .then((value) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GamePlay(),
                                    ),
                                  );
                                });
                              } else {
                                Mystyle.snackb(scaffoldKey, " نقط اكتر للعب هدا المستوى");
                                return null;
                              }
                            } else {
                              BlocProvider.of<FeedCubit>(context)
                                  .getQuestions(index + 1)
                                  .then((value) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GamePlay(),
                                  ),
                                );
                              });
                            }
                          },
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "المستوى \n" + lvlNames[index],
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                color: colorOFLevel(state.point.name, index),
                              ),
                              Positioned(
                                  bottom: 3,
                                  right: 0,
                                  child: Save.getlevel().contains((index + 1).toString())
                                      ? locked("checked", index)
                                      : locked(state.point.name, index)),
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  String textOfLevel(index) {
    return index < 6
        ? easy
        : index > 14
            ? hard
            : medium;
  }

  String easy = "سهل";
  String medium = "متوسط";
  String hard = "صعب";

  Color? colorOFLevel(status, index) {
    print(status);
    if (index < 6) {
      return Colors.teal[100];
    } else if ((status != "easy") && index < 20) {
      return Colors.blue[100];
    } else if ((status == "hard" || status == "legendary")) {
      return Colors.red[200];
    } else {
      return Colors.grey;
    }
  }

  Icon locked(status, index) {
    // print(status);
    if (status == "checked") {
      return Icon(
        Icons.check_circle,
        color: Mystyle.rightAnswer,
        size: 33,
      );
    }
    if (status == "easy" && index < 20 && index > 5) {
      return Icon(
        Icons.lock,
        color: Colors.black45,
        size: 33,
      );
    } else if ((status == "medium" || status == "easy") && index >= 20) {
      return Icon(
        Icons.lock,
        color: Colors.black87,
        size: 33,
      );
    } else {
      return Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      );
    }
  }
}
