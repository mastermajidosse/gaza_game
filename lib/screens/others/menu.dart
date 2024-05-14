import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/points/points_cubit.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/screens/gameplay/gameplay_screen.dart';
import 'package:gaza/screens/others/about_us.dart';
import 'package:gaza/screens/others/levels.dart';
import 'package:gaza/screens/others/more.dart';
import 'package:gaza/screens/others/splash.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:gaza/utils/save.dart';
import 'package:gaza/utils/widgets/heard_widget.dart';
import 'package:rate_my_app/rate_my_app.dart';

class Menu extends StatefulWidget {
  static const routeName = 'Menu';

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Save save = Save();
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 3,
    minLaunches: 7,
    remindDays: 3,
    remindLaunches: 10,
  );

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    rateMyApp.init().then((_) {
      if (rateMyApp.shouldOpenDialog) {
        // TODO: Comment out this if statement to test rating dialog (Remember to uncomment)
        // if (rateMyApp.shouldOpenDialog) {
        rateMyApp.showStarRateDialog(
          context,
          title: 'هل تستمع باللعبة',
          message: 'المرجوا وضع تقييم جيد لنستمر بتطويرها للأفضل',

          actionsBuilder: (context, stars) {
            return [
              TextButton(
                child: Text('Ok'),
                onPressed: () async {
                  if (stars! <= 3) {
                    // print('Navigate to Contact Us Screen');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Splashs(),
                      ),
                    );
                  } else if (stars > 3) {
                    // print('تفضل بوضع تقييمك');
                    await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
                    Navigator.pop<RateMyAppDialogButton>(context, RateMyAppDialogButton.rate);
                  }
                },
              ),
              TextButton(
                child: Text('cancel'),
                onPressed: () async {
                  Navigator.pop(context);
                  rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed);
                },
              ),
            ];
          },
          dialogStyle: DialogStyle(
            // Custom dialog styles.
            titleAlign: TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20),
          ),

          starRatingOptions: StarRatingOptions(), // Custom star bar rating options.
          onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
              .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
        );
      }
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          decoration: Mystyle.bgdeco(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: BlocBuilder<PointsCubit, PointsState>(
                builder: (context, state) {
                  return state is PointsLoaded
                      ? Center(
                          child: Text(
                            "${state.point.points} P",
                            style: TextStyle(
                              color: Mystyle.textColo,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Container();
                },
              ),
            ),
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 36),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "لعبة تاريخ",
                          style: Mystyle.titleMenu,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80.h),
                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        BlocBuilder<SystemsCubit, SystemsState>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                // if (state is SystemsZero) {
                                //   Mystyle.snack(
                                //     scaffoldKey,
                                //     Icons.remove_from_queue_outlined,
                                //     Colors.red,
                                //     "لقد خسرت انتظر غدا للمحاولة مرة اخرى",
                                //   );
                                // } else
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LevelScreen(),
                                    ),
                                  );
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Container(
                                width: double.infinity,
                                height: 70.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Mystyle.secondrycolo.withOpacity(.9),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  'ابدأ ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => More()),
                            );
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            width: double.infinity,
                            height: 65.h,
                            decoration: BoxDecoration(
                              color: Mystyle.colodark,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'تطبيقات اخرى',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AboutUs()),
                            );
                            // final Email email = Email(
                            //   body: "",
                            //   subject: 'لعبة تاريخ',
                            //   recipients: ['masters.tech.otm@gmail.com'],
                            //   isHTML: false,
                            // );

                            // await FlutterEmailSender.send(email);
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            width: double.infinity,
                            height: 65.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Mystyle.colodarker,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              ' اتصل بنا ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  BlocBuilder<PointsCubit, PointsState>(builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey[300],
                              color: Mystyle.secondrycolo,
                              value: state is PointsLoaded ? state.point.progress : 0,
                              minHeight: 12,
                            ),
                          ),
                          SizedBox(height: 5),
                          // BlocBuilder<PointsCubit, PointsState>(
                          //   builder: (context, state) {
                          // return
                          state is PointsLoaded
                              ? Center(
                                  child: Text(
                                    "بقي ${state.point.nxtlevel.toString()} نقطة للوصول للمستوى القادم ",
                                    style: Mystyle.smalltxtwhite.copyWith(
                                      color: Colors.grey[300],
                                      fontSize: ScreenUtil().setSp(16),
                                    ),
                                  ),
                                )
                              : CircularProgressIndicator(),
                        ],
                      ),
                    );
                  }),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
