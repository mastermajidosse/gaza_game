import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/utils/mystyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/utils/mystyle.dart';

class SupportCard extends StatelessWidget {
  List onBoardingData = [
    PostModel(
      title: "انشاء موقع سوشل ميديا",
      desc:
          "انشاء جيل على علم ودراية واستمرار القضية في عقولهم مهما حاولت الدول العظمى طمس التاريخ وتغييره لخدمة مصالحهم",
      images: "assets/goal2.png",
    ),
    PostModel(
      title: "لدعم الأفراد",
      desc:
          "كهدف تانوي للتطبيق ، ما اكتشفه العالم العربي ان الحرية المزعومة في مواقع التواصل هي حرية مشروطة لخدمة مصالح الغرب وحتى هده اللحظة لايوجد مكان للعرب فيه الحرية المطلقة لدلك بادن الله سنعمل على انشاء هدا المكان",
      images: "assets/goal3.png",
    ),
    PostModel(
      title: "لدعم المنظمات",
      desc:
          "اهم هدف هو نشر الوعي بما حدت في الماضي وما حدت في حرب غزة الحالية والاحاطة بما حدت حيت ان الأغلبية الساحقة في عالمنا لا تقرأ ولا تبحت عن قراءة التاريخ لدلك اعظم عطاء هو ان تبقى دكرى ما حدق في ادهان الناس",
      images: "assets/goal1.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: true
          ? Center(
              child: Text("coming soon"),
            )
          : ListView.builder(
              itemCount: 3,
              padding: EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => MoreScreen(post)));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: Mystyle.cardhome(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.h),
                          Container(
                            height: 120.w,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://api.time.com/wp-content/uploads/2023/10/watermelon-palestinian.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            onBoardingData[index].title.toString(),
                            style: Mystyle.blackboldtexts,
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            onBoardingData[index].desc.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontSize: ScreenUtil().setSp(12),
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "قراءة المزيد",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue,
                                  fontSize: ScreenUtil().setSp(18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class PostModel {
  String? title;
  String? desc;
  String? images;

  // List? likes;

  PostModel({
    this.title,
    this.desc,
    this.images,
  });
}
