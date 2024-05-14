import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/models/onBordingModel.dart';
import 'package:gaza/screens/others/continue.dart';
import 'package:gaza/utils/mystyle.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = 'OnboardingScreen';

  // bool isonboarding = false;
  OnboardingScreen(); // this.isonboarding
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  //logowalk.svg
  List onBoardingData = [
    OnBoardingData(
      title: "🌟Welcome to the Arena!🌟",
      desc:
          "Step into the ultimate content creation arena! \n\n Where your creativity battles for glory. Ready to be a star? 🚀 Let's go!",
      imageAssetsPath: "assets/images/rule0.png",
    ),
    OnBoardingData(
      firsttitle: "RULE #1",
      title: "⚔️ 1VS1 Challenges ⚔️",
      desc:
          "Ready for a content duel? Battle creators globally in viral challenges. Show off your creative superpowers!",
      imageAssetsPath: "assets/images/rule1.png",
    ),
    OnBoardingData(
      firsttitle: "RULE #2",
      title: "🗳️ Every Vote Rocks! 🗳️",
      desc:
          "At Creaskale, each vote is a voice for art! Help crown the kings and queens of creativity.",
      imageAssetsPath: "assets/images/rule2.png",
    ),
    OnBoardingData(
      firsttitle: "RULE #3",
      title: "🏆  Novice to Legend 🏆",
      desc: "Each challenge counts! Win and climb. Become a Creaskale legend!",
      imageAssetsPath: "assets/images/rule3.png",
    ),
  ];

  PageController controller = PageController();
  Future<bool> csac() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // final _deviceHeight = ScreenUtil().screenHeight;
    final _deviceWidth = ScreenUtil().screenWidth;
    return WillPopScope(
      onWillPop: csac,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PageView.builder(
              controller: controller,
              onPageChanged: (val) {
                setState(() {
                  currentIndex = val;
                });
              },
              itemCount: onBoardingData.length,
              itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 25.h),
                        onBoardingData[index].firsttitle == ""
                            ? Container()
                            : Container(
                                // height: 38.h,
                                width: 150,
                                padding: EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                  // border: Border.all (color: Colors.red, width: 2),
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Mystyle.primarycolo,
                                    width: 10,
                                  )),
                                ),
                                child: Text(
                                  onBoardingData[index].firsttitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Mystyle.primarycolo,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                        SizedBox(height: 50.h),
                        Container(
                          height: 300.h,
                          width: _deviceWidth - 50,
                          alignment: Alignment.center,
                          child: // SvgPicture.asset(
                              Image.asset(
                            '${onBoardingData[index].imageAssetsPath}',
                             width: 300,
                                height: 300,
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${onBoardingData[index].title}',
                            style:  TextStyle(
                                color: Mystyle.primarycolo,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: Mystyle.fontFamilyName,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 80.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${onBoardingData[index].desc}',
                            // style: Mystyle.blackboldtexts,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )),
          bottomNavigationBar: Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onBoardingData.length, (index) {
                      return Container(
                        height: 12,
                        width: 12,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: index == currentIndex ? Colors.blue : Colors.black12,
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex == onBoardingData.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContinueScreen(),
                          ),
                        );

                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AppStartScreen(),
                        //   ),
                        // );
                      } else {
                        controller.nextPage(
                          duration: Duration(
                            seconds: 1,
                          ),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    onLongPress: () {
                      // Phoenix.rebirth(context);
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SplashHome(true)));
                    },
                    child: Container(
                      height: 80.h,
                      width: 100.w,
                      padding: EdgeInsets.only(right: 35.w),
                      alignment: Alignment.centerRight,
                      color: Colors.transparent,
                      child: Text(
                        currentIndex == onBoardingData.length - 1 ? "Start" : 'Next',
                        style:TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: ScreenUtil().setSp(13),
                              ) .copyWith(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
