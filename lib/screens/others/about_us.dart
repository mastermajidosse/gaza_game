import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/more/more_cubit.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/screens/auth/onboarding_screen.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:gaza/utils/widgets/github_card.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});
  static const routeName = 'AboutUs';

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 246, 246),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 229, 229, 251), //Mystyle.colodark,
          elevation: 1.0,
          leading: BackButton(
            color: Color(0xFF282739), //Mystyle.textlighColo,
          ),
          title: Text(
            "معلومات اضافية",
            style: TextStyle(
              fontFamily: 'butros',
              color: Color(0xFF282739),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "فريق العمل",
                  style: Mystyle.butblackTextStyle,
                ),
                DeveloperCard(
                  name: 'عثمان',
                  username: 'otmaneelmajid',
                  profileImageUrl:
                      'https://w7.pngwing.com/pngs/504/952/png-transparent-programmer-computer-programming-it-furniture-reading-computer.png',
                  linkto: 'https://github.com/mastermajidosse',
                  description: ' ',
                ),
                DeveloperCard(
                  name: 'سعيدة',
                  username: 'كتابة الأسئلة ومحتوى اللعبة',
                  profileImageUrl:
                      'https://static.vecteezy.com/system/resources/previews/038/704/057/non_2x/hijab-girl-illustration-vector.jpg',
                  linkto: '',
                  description: ' ',
                ),
                DeveloperCard(
                  name: 'عمر',
                  username: 'انشاء موقع لتمكين ادخال اسئلة اللعبة ',
                  profileImageUrl:
                      'https://img.freepik.com/free-vector/cute-man-working-laptop-with-coffee-cartoon-vector-icon-illustration-people-technology-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-3869.jpg?size=338&ext=jpg&ga=GA1.1.44546679.1716163200&semt=ais_user',
                  linkto: 'https://github.com/OmarDefaoui',
                  description: ' ',
                ),
                DeveloperCard(
                  name: 'حسام',
                  username: 'مساعدة في برمجة اللعبة',
                  profileImageUrl:
                      'https://img.freepik.com/free-vector/hacker-operating-laptop-cartoon-icon-illustration-technology-icon-concept-isolated-flat-cartoon-style_138676-2387.jpg?size=338&ext=jpg&ga=GA1.1.44546679.1716163200&semt=ais_user',
                  linkto: 'https://github.com/hjabbouri',
                  description: ' ',
                ),
                SizedBox(height: 12),
                // Row(
                //   children: [
                //     Text(
                //       "أهدافنا ",
                //       style: Mystyle.butblackTextStyle,
                //     ),
                //     Text(
                //       "(اضغط على الصورة)",
                //     ),
                //   ],
                // ),
                Spacer(),

                InkWell(
                  onTap: () {
                    BlocProvider.of<SystemsCubit>(context).clear(context);
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
                      ' مسح معلومات اللعبة للاعادتها من جديد ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Text(
                    "شكرا لدعمكم ومشاركتكم ومرحبا بكل من يريد التواصل معنا ",
                    style: Mystyle.butblackTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
