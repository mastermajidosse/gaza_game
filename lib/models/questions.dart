import 'package:gaza/models/levelQ.dart';

class QuestionModel {
  String? id;
  String? type;
  String? name;
  String? database;
  String? questions;
  // List<LevelM>? questions;

  QuestionModel({
    this.id,
    this.type,
    this.name,
    this.database,
    this.questions,
  });

  static QuestionModel fromJson(Map<String, dynamic> json) {
    print(json['id'] + " ||  " + json['questions']);
    return QuestionModel(
      id: json['id'],
      name: json['name'],
      database: json['database'],
      questions: json['questions'],
      type: json['type'],
    );
  }

  factory QuestionModel.fromMap(Map<String, dynamic> json) {
    print(json['id'] +
        " ||  " +
        json['name'] +
        " ||  " +
        json['database'] +
        " ||  " +
        json['type'] +
        " ||  ");

    return QuestionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      database: json['database'] as String,
      type: json['type'] as String,
      questions: json['questions'].toString(),
      // questions: List<LevelM>.from(((json['questions'] is List)
      //     ? json['questions']
      //     : json['questions']) as List),
    );
  }

  static QuestionModel toJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      name: json['name'],
      database: json['database'],
      questions: json['questions'],
      type: json['type'],
    );
  }
}
