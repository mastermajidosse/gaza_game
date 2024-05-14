import 'package:flutter/material.dart';

class OnBoardingData with ChangeNotifier {
  String? imageAssetsPath;
  String? title;
  String firsttitle = "";
  String? desc;
  String? firstContainer;
  String? secondContainer;

  OnBoardingData({
    this.title,
    this.desc,
    this.firsttitle = "",
    this.firstContainer,
    this.imageAssetsPath,
    this.secondContainer,
  });
}
