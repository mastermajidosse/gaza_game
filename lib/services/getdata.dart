import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gaza/models/games.dart';
import 'package:gaza/models/levelQ.dart';
import 'package:gaza/models/questions.dart';
import 'package:gaza/services/api.dart';
import 'package:gaza/utils/save.dart';

class Getdata {
  static final Getdata postServices = Getdata._internal();
  Getdata._internal();

  factory Getdata() {
    return postServices;
  }

  Api api = Api();

  List<LevelM>? listslawkh;
  List<Games>? allgames;

  Future<List<LevelM>?> fetchQuestions(int levelnum) async {
    listslawkh = [];
    int nowlevel = levelnum - 1;

    print("fetchQuestions");
    final String response = await rootBundle.loadString('assets/questionsall.json');
    // print("1");
    final data = json.decode(response);

    // List<QuestionModel> listLevels = (json.decode(response) as List)
    //     .map((level) => QuestionModel.fromMap(level))
    //     .toList();

    // print("num 3");
    if (data == null) {
      return null;
    }

    data[nowlevel]['questions'].forEach((l) {
      // print("5");
      try {
        listslawkh!.add(LevelM.fromJson(l));
      } catch (e) {
        print(e.toString());
      }
    });

    return listslawkh;
  }

  Future<List<LevelM>?> fetchQuestionsOnePlace() async {
    listslawkh = [];
    // final String response =
    await rootBundle.loadString('assets/questionall.json').then((response) {
      // print(response.length);
      final data = json.decode(response);
      // print(data['data'].toString());
      if (data == null) {
        return null;
      }
      data['data'].forEach((l) {
        listslawkh!.add(LevelM.fromJson(l));
      });
    });

    return listslawkh;
  }
  // Future<List<Lawkh>?> fetchlawkh() async {
  //   listslawkh = [];
  //   await api.httpGet('api/lawkh').then((response) {
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       if (data["data"] == null) {
  //         return null;
  //       }
  //       data["data"].forEach((l) {
  //         listslawkh!.add(Lawkh.fromJson(l));
  //       });
  //     } else {
  //       throw Exception('Failed to load album ');
  //     }
  //   });
  //   return listslawkh;
  // }

  Future<List<Games>?> fetchallg() async {
    allgames = [];
    await api.httpGet('api/allgames').then((response) {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["data"] == null) {
          return null;
        }
        data["data"].forEach((l) {
          if (l["name"] != Save.app_name && l["lang"] == Save.lang) {
            allgames!.add(Games.fromJson(l));
          }
        });
      } else {
        throw Exception('Failed to load album ');
      }
    });
    print(allgames!.length);
    return allgames;
  }

  // //////////////////

  Future addlawkh(Object bob) async {
    // add comments
    return await api
        .httpPost('api/lawkh', body: bob //{...:...}
            )
        .then((reponse) {
      var data = jsonDecode(reponse.body);
      print(data);
      print('Response status: ${reponse.statusCode}');
    });
  }

  ///
  /// votes

  Future voteA(String id) async {
    return await api.httpPut('api/upvote/' + id).then((reponse) {
      // var data = jsonDecode(reponse.body);
      // print(data);
      print('Response status: ${reponse.statusCode}');
    });
  }

  Future voteB(String id) async {
    return await api.httpPut('api/upvoteb/' + id).then((reponse) {
      // var data = jsonDecode(reponse.body);
      // print(data);
      print('Response status: ${reponse.statusCode}');
    });
  }
}
