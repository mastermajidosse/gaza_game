part of 'points_cubit.dart';

class PointsState {
  const PointsState({
    this.point,
    this.errorMessage,
    this.drop,
    this.loading,
  });

  final PointsModel? point;
  final List<String>? drop;
  final String? errorMessage;
  final bool? loading;

  PointsState copyWith({
    String? errorMessage,
    PointsModel? point,
    List<String>? drop,
    bool? loading,
  }) {
    return PointsState(
      point: point ?? this.point,
      errorMessage: errorMessage ?? this.errorMessage,
      drop: drop ?? this.drop,
      loading: loading ?? this.loading,
    );
  }
}
