import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/points/points_cubit.dart';
import 'package:gaza/models/level_menu.dart';
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

  List<LevelMenu> myLevels = [
    LevelMenu(
      title: LevelMenu().lvlNames[0],
      colo: Colors.teal[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[1],
      colo: Colors.teal[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[2],
      colo: Colors.teal[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[3],
      colo: Colors.teal[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[4],
      colo: Colors.teal[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[5],
      colo: Colors.teal[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[6],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[7],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[8],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[9],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[10],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[11],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[12],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[13],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[14],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[15],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[16],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[17],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[18],
      colo: Colors.blue[100]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[19],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[20],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[21],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[22],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[23],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[24],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[25],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[26],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[27],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[28],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    LevelMenu(
      title: LevelMenu().lvlNames[29],
      colo: Colors.red[200]!,
      islocked: Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      ),
    ),
    // LevelMenu(
    //   title: LevelMenu().lvlNames[30],
    //   colo: Colors.red[200]!,
    //   islocked: Icon(
    //     Icons.check_circle,
    //     color: Colors.transparent,
    //     size: 33,
    //   ),
    // ),
  ];

  @override
  void initState() {
    super.initState();
  }

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
            body: state.loading == false
                ? Container(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: List.generate(30, (index) {
                        return InkWell(
                          onTap: () {
                            print(index);
                            if (Save.getlevel().contains((index + 1).toString())) {
                              Mystyle.snackb(
                                  scaffoldKey,
                                  "لا يمكن لعب المستوى اكتر من مرة يمكنك مسح بيانات اللعبة بالرجوع الى معلومات اضافية",
                                  context);
                              return null;
                            }
                            if (Save.life <= 0) {
                              Mystyle.snackb(scaffoldKey, "ليس لديك فرص متبقية", context);
                              return null;
                            }
                            if (index > 14) {
                              print("hard .. " + state.point!.points.toString());
                              if (state.point!.points! > 90) {
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
                                Mystyle.snackb(
                                    scaffoldKey, " تحتاج نقط اكتر للعب هدا المستوى", context);
                                return null;
                              }
                            } else if (index > 5 && index < 15) {
                              print("stat .. " + state.point!.points.toString());
                              if (state.point!.points! > 30) {
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
                                Mystyle.snackb(
                                    scaffoldKey, " تحتاج نقط اكتر للعب هدا المستوى", context);
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
                                      "المستوى \n" + myLevels[index].title.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                color: myLevels[index].colo,
                              ),
                              Positioned(
                                  bottom: 3,
                                  right: 0,
                                  child: Save.getlevel().contains((index + 1).toString())
                                      ? locked("checked", index)
                                      : locked(state.point!.name, index)),
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
    } else if (status != "hard" && index > 19) {
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
