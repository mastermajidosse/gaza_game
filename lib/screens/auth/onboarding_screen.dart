import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/models/onBordingModel.dart';
import 'package:gaza/screens/others/continue.dart';
import 'package:gaza/screens/others/menu.dart';
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
      firsttitle: "هدف #1",
      title: "🌟نشر الوعي !🌟",
      desc:
          "اهم هدف هو نشر الوعي بما حدت في الماضي وما حدت في حرب غزة الحالية والاحاطة بما حدت حيت ان الأغلبية الساحقة في عالمنا لا تقرأ ولا تبحت عن قراءة التاريخ لدلك اعظم عطاء هو ان تبقى دكرى ما حدق في ادهان الناس",
      imageAssetsPath: "assets/goal1.png",
    ),
    OnBoardingData(
      firsttitle: "هدف #2",
      title: "⚔️ ترسيخ القضية في الجيل الصاعد ⚔️",
      desc:
          "انشاء جيل على علم ودراية واستمرار القضية في عقولهم مهما حاولت الدول العظمى طمس التاريخ وتغييره لخدمة مصالحهم",
      imageAssetsPath: "assets/goal2.png",
    ),
    OnBoardingData(
      firsttitle: "هدف #3",
      title: "🌐 انشاء سوشل ميديا عربية ! 🌐",
      desc:
          "كهدف تانوي للتطبيق ، ما اكتشفه العالم العربي ان الحرية المزعومة في مواقع التواصل هي حرية مشروطة لخدمة مصالح الغرب وحتى هده اللحظة لايوجد مكان للعرب فيه الحرية المطلقة لدلك بادن الله سنعمل على انشاء هدا المكان",
      imageAssetsPath: "assets/goal3.png",
    ),
    OnBoardingData(
      firsttitle: "هدف #4",
      title: "🙏 تقديم مساعدات مادية مباشرة  🙏",
      desc:
          "بالطبع الهدف الاضافي والطريقة المباشرة للمساعدة هو مساعدة المنظمات و الأفراد داخل غزة بشكل مادي مباشر",
      imageAssetsPath: "assets/goal4.png",
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
                        Container(
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
                          child: Image.asset(
                            '${onBoardingData[index].imageAssetsPath}',
                            width: 300,
                            height: 300,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${onBoardingData[index].title}',
                            style: TextStyle(
                              color: Mystyle.primarycolo,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: Mystyle.fontFamilyName,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 55.h),
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
                            builder: (context) => Menu(),
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
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => Menu()));
                    },
                    child: Container(
                      height: 80.h,
                      width: 100.w,
                      padding: EdgeInsets.only(right: 35.w),
                      alignment: Alignment.centerRight,
                      color: Colors.transparent,
                      child: Text(
                        currentIndex == onBoardingData.length - 1 ? "Start" : 'Next',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: ScreenUtil().setSp(13),
                        ).copyWith(
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
