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
    if (await canLaunch(url)) {
      await launch(url);
    } else {
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
    return BlocBuilder<MoreCubit, MoreState>(builder: (context, state) {
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
            ),
            title: Text("العاب اخرى", style: Mystyle.moretitleTextStyle),
            centerTitle: true,
          ),
          body: state is MoreLoading
              ? SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 50.0,
                  controller: AnimationController(
                      vsync: this, duration: const Duration(milliseconds: 1200)),
                )
              : state is MoreLoaded
                  ? ListView.builder(
                      itemCount: state.allgame.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () => launchURL(state.allgame[index].link),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                color: Colors.black12,
                              ),
                            )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 55,
                                        child: CachedNetworkImage(
                                          imageUrl: state.allgame[index].icon!,
                                          height: 55.h,
                                          width: double.infinity,
                                          imageBuilder: (context, imageProvider) => Container(
                                            height: 55.h,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),

                                        // Container(
                                        //   width: 55,
                                        //   height: 55,
                                        //   decoration: BoxDecoration(
                                        //     // color: Colors.black,
                                        //     borderRadius:
                                        //         BorderRadius.circular(100),
                                        //     image: DecorationImage(
                                        //       image: NetworkImage(
                                        //       ),
                                        //       fit: BoxFit.fitWidth,
                                        //     ),
                                        //   ),
                                        //   child: Image.network(
                                        //       "https://images.gofundme.com/nXZQjDEdnDuHrY96dXs1D6v7jp8=/720x405/https://d2g8igdw686xgo.cloudfront.net/64550899_1649356998460419_r.jpeg"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.allgame[index].name.toString(),
                                              style: Mystyle.butblackTextStyle,
                                            ),
                                            Text(
                                              state.allgame[index].downloads.toString() + " تحميل",
                                              style: Mystyle.butblackTextStyle,
                                              // textAlign: TextAlign.right,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "اضغط هنا",
                                          style: Mystyle.smalltxt.copyWith(
                                            color: Mystyle.colodarker,
                                          ),
                                        ),
                                        Text(
                                          "للتحميل",
                                          style: Mystyle.smalltxt.copyWith(
                                            color: Mystyle.colodarker,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Container(),
        ),
      );
    });
  }
}
