class PointsModel {
  int? id;
  String? name;
  int? nxtlevel;
  int? points;
  double? progress;

  PointsModel({
    this.id,
    this.name,
    this.nxtlevel,
    this.progress,
    this.points,
  });

  static PointsModel fromJson(Map<String, dynamic> json) {
    return PointsModel(
      id: json['id'],
      name: json['name'],
      nxtlevel: json['nxtlevel'],
      progress: json['progress'],
      points: json['points'],
    );
  }

  static PointsModel toJson(Map<String, dynamic> json) {
    return PointsModel(
      id: json['id'],
      name: json['name'],
      nxtlevel: json['nxtlevel'],
      progress: json['progress'],
      points: json['points'],
    );
  }
}
