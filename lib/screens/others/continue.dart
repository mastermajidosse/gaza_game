import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/screens/others/menu.dart';
import 'package:gaza/utils/mystyle.dart';

class ContinueScreen extends StatelessWidget {
  static const routeName = 'ContinueScreen';

  const ContinueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFF282739), //552a16
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Menu()),
                        );
                      },
                      child: Image.asset("assets/icon.png"),
                    ),
                  ),
                  //logo
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: 200.h,
                    color: Color.fromARGB(255, 229, 229, 251),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Menu()),
                            );
                          },
                          child: Container(
                            width: 300.w,
                            height: 65.h,
                            alignment: Alignment.center,
                            decoration: Mystyle.buttonrounded(),
                            child: Text(
                              "استمر",
                              style: TextStyle(
                                fontFamily: "moh",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(26),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
