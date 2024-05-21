import 'package:flutter/material.dart';
import 'package:gaza/utils/mystyle.dart';

class LevelMenu {
  int id;
  String? title;
  Color? colo;
  Icon? islocked;
  String? status;

  LevelMenu({
    this.id = 0,
    this.title,
    this.colo,
    this.islocked,
    this.status,
  });

  List<String> lvlNames = [
    "الأول",
    "التاني",
    "التالت",
    "الرابع",
    "الخامس",
    "السادس",
    "السابع",
    "التامن",
    "التاسع",
    "العاشر",
    "الحادي عشر",
    "التاني عشر",
    "التالت عشر",
    "الرابع عشر",
    "الخامس عشر",
    "السادس عشر",
    "السابع عشر",
    "التامن عشر",
    "التاسع عشر",
    "العشرون",
    "الواحد والعشرون",
    "التاني والعشرون",
    "التالت والعشرون",
    "الرابع والعشرون",
    "الخامس والعشرون",
    "السادس والعشرون",
    "السابع والعشرون",
    "التامن والعشرون",
    "التاسع والعشرون",
    "التلاتون",
  ];

  String statuslevel(index) {
    if (index < 20 && index > 6) {
      return "medium";
    } else if (index >= 20) {
      return "hard";
    } else
      return "easy";
  }
  // Color colorOFLevel(index) {
  //   if (index < 20 && index > 6) {
  //     return Colors.blue[100]!;
  //   } else if (index >= 20) {
  //     return Colors.red[200]!;
  //   } else
  //     return Colors.teal[100]!;
  // }

  Icon locked(status, index) {
    // print(status);
    if (status == "checked") {
      return Icon(
        Icons.check_circle,
        color: Mystyle.rightAnswer,
        size: 33,
      );
    }
    if (status == "easy" && index < 20 && index > 5) {
      return Icon(
        Icons.lock,
        color: Colors.black45,
        size: 33,
      );
    } else if (status != "hard" && index >= 20) {
      return Icon(
        Icons.lock,
        color: Colors.black87,
        size: 33,
      );
    } else {
      return Icon(
        Icons.check_circle,
        color: Colors.transparent,
        size: 33,
      );
    }
  }
}
