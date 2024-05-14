import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gaza/bloc/more/more_cubit.dart';
import 'package:gaza/utils/mystyle.dart';
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

  Widget buildCard({
    String iconUrl = 'assets/heart.png',
    String description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin commodo.',
    String action = 'Action',
    String url = '',
  }) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: AssetImage(iconUrl),
                width: double.infinity,
                height: 145,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              textAlign: TextAlign.left,
              style: TextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              width: 300,
              height: 40,
              child: TextButton(
                onPressed: () {
                  launchURL(url);
                },
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  elevation: 3,
                  backgroundColor: Color(0xFF7469B6),
                  foregroundColor: Colors.white, //Color(0xFFFFE6E6),
                ),
                child: Text(
                  action,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),
            ),
          ),
        ],
      ),
      color: Color(0xFFc9c9ff),
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 5,
      margin: EdgeInsets.all(8.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreCubit, MoreState>(builder: (context, state) {
      return Directionality(
        textDirection: TextDirection.ltr, //.rtl,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF282739),
          // backgroundColor: Color.fromARGB(255, 245, 240, 228),rgb()
          appBar: AppBar(
            backgroundColor:
                Color.fromARGB(255, 229, 229, 251), //Mystyle.colodark,
            elevation: 1.0,
            leading: BackButton(
              color: Color(0xFF282739), //Mystyle.textlighColo,
            ),
            title: Text(
              "للدعم",
              style: TextStyle(
                fontFamily: 'butros',
                color: Color(0xFF282739),
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
              ), //Mystyle.moretitleTextStyle,
            ),
            centerTitle: true,
          ),
          body: state is MoreLoading
              ? SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 50.0,
                  controller: AnimationController(
                      vsync: this,
                      duration: const Duration(milliseconds: 1200)),
                )
              : Column(
                  children: [
                    // icon, description, action, url
                    buildCard(),
                    buildCard(),
                    buildCard(),
                  ],
                ),
        ),
      );
    });
  }
}
