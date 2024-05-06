class LevelM {
  int? id;
  String image;
  // truefalse , multi , one
  String? type;
  // easy , moderate , hard
  String? difficulty;
  String? qst;
  String? answers;
  String? info;
  List<String>? falseanswers;

  LevelM({
    this.id = 0,
    this.qst,
    this.answers,
    this.falseanswers,
    this.info,
    this.image = "",
    this.type,
    this.difficulty,
  });

  int point(difficult) => difficult == "easy"
      ? 5
      : difficult == "moderate"
          ? 15
          : 20;

  static LevelM fromJson(Map<String, dynamic> json) {
    // print(
    //     "${json['id']} ${json['qst']} ${json['answers']} ${json['falseanswers']} ");
    List<String> falsan = [
      json['falseanswers'].split('.')[0],
      json['falseanswers'].split('.')[1],
      json['falseanswers'].split('.')[2],
      // json['falseanswers'].split('.')[3],
    ];
    return LevelM(
      id: json['id'],
      qst: json['qst'],
      answers: json['answers'],
      falseanswers: falsan,
      image: json['image'],
      type: json['type'],
      info: json['info'],
      difficulty: json['difficulty'],
    );
  }

  static LevelM toJson(Map<String, dynamic> json) {
    return LevelM(
      id: json['id'],
      qst: json['qst'],
      answers: json['answers'],
      falseanswers: json['falseanswers'],
      image: json['image'],
      type: json['type'],
      info: json['info'],
      difficulty: json['difficulty'],
    );
  }
}
