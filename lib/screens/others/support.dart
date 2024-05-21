import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gaza/bloc/more/more_cubit.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:gaza/utils/widgets/card_widget.dart';
import 'package:gaza/utils/widgets/support_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatefulWidget {
  static const routeName = 'More';

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> with SingleTickerProviderStateMixin {
  launchURL(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MoreCubit>(context).getallgame();
  }

  var scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, //.rtl,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color.fromARGB(255, 246, 246, 246),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 229, 229, 251), //Mystyle.colodark,
          elevation: 1.0,
          leading: BackButton(
            color: Color(0xFF282739), //Mystyle.textlighColo,
          ),
          title: Text(
            "للدعم",
            style: TextStyle(
              fontFamily: 'butros',
              color: Color(0xFF282739),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ), //Mystyle.moretitleTextStyle,
          ),
          centerTitle: true,
        ),
        body: SupportCard(),
      ),
    );
  }
}
