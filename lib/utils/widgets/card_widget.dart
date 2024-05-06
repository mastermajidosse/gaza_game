import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/utils/mystyle.dart';

class CardGamePlay extends StatelessWidget {
  FeedLoaded state;
  CardGamePlay(this.state);

  @override
  Widget build(BuildContext context) {
    final data = state.questions[state.index];
    final alllenght = state.questions.length;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: data.type == "truefalse"
            ? 330
            : data.id! == 0
                ? 270
                : state.level % 2 == 0 && data.type == "multi"
                    ? 330
                    : 270,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المستوى ${state.level.toString()}",
                      style: TextStyle(color: Colors.transparent)),
                  Text("سؤال ${state.index + 1} من اصل ${alllenght}",
                      style: TextStyle(color: Colors.transparent)),
                  Text("المستوى 10", style: TextStyle(color: Colors.transparent)),
                ],
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 28.0, right: 28.0, bottom: 22.0),
                child: AutoSizeText(
                  data.qst!,
                  style: Mystyle.blackboldtexts.copyWith(
                    fontSize: 18,
                  ),
                  minFontSize: 12,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            (state.level % 2 == 0 && data.type == "multi")
                ? Padding(
                    padding: EdgeInsets.only(left: 39.0, right: 39.0, bottom: 22.0),
                    child: CachedNetworkImage(
                      imageUrl: data.image.toString(),
                      height: data.id! == 0 ? 0 : 200.h,
                      width: double.infinity,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          Center(child: Container(color: Colors.grey[100])),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
