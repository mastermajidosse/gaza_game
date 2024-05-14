import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Mystyle {
  static String fontFamilyName = 'boutros';
  // ------ Colors --------

  static const Color primarycolo = Color(0xFF2b2e36);
  static const Color secondrycolo = Color(0xFF70c13c);
  static const Color thirdcolo = Color(0xFFff135c);
  static const Color rightAnswer = Color(0xFF40bd75); // #40bd75

  static const Color textColo = Color(0xFFdbbb61); // ##dbbb61
  static const Color textlighColo =
      Color.fromARGB(255, 255, 233, 173); // ##dbbb61

  static const Color colofadaa = Color(0xFF030f49);
  static const Color colotarikh = Color(0xFF8a6d33);
  static const Color colodark = Color(0xFF502514);
  static const Color colodarker = Color(0xFF320800);
  static const Color coloTxtdarker = Color(0xFF89474c); // #89474c

// ------ TextStyle --------

  static TextStyle titleTextStyle = TextStyle(
    color: secondrycolo,
    fontWeight: FontWeight.w800,
    fontSize: 32,
    fontFamily: fontFamilyName,
  );
  static TextStyle titleMenu = TextStyle(
    fontFamily: fontFamilyName,
    color: Color(0xFFdbbb61),
    fontWeight: FontWeight.w800,
    fontSize: 66.sp,
  );
  static TextStyle textMenu = TextStyle(
    fontFamily: fontFamilyName,
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 38.sp,
  );

  static TextStyle tagsTextStyle = TextStyle(
    fontFamily: fontFamilyName,
    color: Colors.white,
    fontSize: ScreenUtil().setSp(34),
  );

  static TextStyle butTextStyle = TextStyle(
    fontFamily: fontFamilyName,
    color: Colors.white,
    fontSize: ScreenUtil().setSp(38),
    fontWeight: FontWeight.w600,
  );
  static TextStyle moretitleTextStyle = TextStyle(
    fontFamily: fontFamilyName,
    color: textlighColo,
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle butblackTextStyle = TextStyle(
    fontFamily: fontFamilyName,
    color: Color(0xff8E3200),
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static TextStyle descextStyle = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil().setSp(42),
    color: Colors.black87,
  );

  static TextStyle titlebodyStyle = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: ScreenUtil().setSp(64),
  );

  static TextStyle subtitlebodyStyle = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: ScreenUtil().setSp(54),
  );

  static TextStyle greenctexts = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.bold,
    color: secondrycolo,
  );
  static TextStyle blackboldtexts = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: ScreenUtil().setSp(26),
  );
  static TextStyle whiteboldtexts = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: ScreenUtil().setSp(26),
  );
  static TextStyle truefalsewhite = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: ScreenUtil().setSp(22),
  );
  static TextStyle smalltxtwhite = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: ScreenUtil().setSp(18),
  );
  static TextStyle smalltxt = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
    fontSize: ScreenUtil().setSp(18),
  );

  // -------------

  static homecardDecotation2(link) {
    return BoxDecoration(
      // color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: primarycolo.withBlue(200).withOpacity(.3),
          blurRadius: 10.0,
        ),
      ],
      image: DecorationImage(
        image: AssetImage(link),
        fit: BoxFit.fitHeight,
      ),
    );
  }

  static circleDecotationEmpty() {
    return BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      border: Border.all(
        color: primarycolo.withOpacity(.4),
      ),
    );
  }

  static borderwhiteResponse({int index = 0}) {
    return BoxDecoration(
        color: index == 1
            ? Colors.green
            : index == 2
                ? Colors.red
                : Colors.transparent,
        border: Border.all(color: Colors.white.withOpacity(.15)));
  }

  static borderindice({int index = 0, Color colorop = colodark}) {
    return BoxDecoration(
        color: colorop.withOpacity(.4),
        border: Border.all(color: Colors.white.withOpacity(.15)));
  }

  static bgdeco() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF282739),//0xFF322C2B
          Color(0xFF803D3B), //
        ],
        tileMode: TileMode.clamp,
      ),
    );
  }

  static buttDecotatio() {
    return BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(223, 5, 113, 1),
          Color.fromRGBO(143, 41, 124, 1)
        ]),
        color: Color.fromRGBO(204, 14, 116, 1));
  }

  static imgshhome(url) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
      image: DecorationImage(image: AssetImage(url)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300]!.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  static buttonrounded() {
    return BoxDecoration(
      color: Color(0xFF212033),//502514
      borderRadius: BorderRadius.circular(100),
    );
  }

  static imgshnet(url) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(100),
      image: DecorationImage(
        image: NetworkImage(
          isNullEmptyOrFalse(url)
              ? "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
              : url,
        ),
        fit: BoxFit.cover,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300]!.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  // ------------- Loading

  static loadingWidget() {
    return Center(
      child: SpinKitChasingDots(
        color: Colors.white,
      ),
    );
  }

  // ------------- Inputs ----------

  static inputregular(hint, {icon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      fillColor: Color(0xFF808286),
      suffixIcon: icon,
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      labelStyle: butTextStyle,
      errorStyle: butTextStyle,
    );
  }

  // ------------- popup ----------

  static snack(scaffoldKey, ico, colo, txt) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(ico),
            Text(txt, style: truefalsewhite),
          ],
        ),
        backgroundColor: colo,
      ),
    );
  }

  static snackb(scaffoldKey, txt) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(txt, style: truefalsewhite),
        backgroundColor: Colors.black,
      ),
    );
  }

  // -------------
  static bool isNullEmptyOrFalse(Object? o) =>
      o == null || false == o || "" == o;

  static bool isNullEmptyFalseOrZero(Object o) =>
      o == null || false == o || 0 == o || "" == o;
}
