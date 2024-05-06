import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/feed/feed_cubit.dart';
import 'package:gaza/bloc/fullanswear/fullanswear_cubit.dart';
import 'package:gaza/bloc/more/more_cubit.dart';
import 'package:gaza/bloc/multi/multi_cubit.dart';
import 'package:gaza/bloc/one/one_cubit.dart';
import 'package:gaza/bloc/points/points_cubit.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/bloc/truefalse/trueorfalse_cubit.dart';

List<BlocProvider> bproviders = [
  BlocProvider<FeedCubit>(
    create: (BuildContext context) => FeedCubit(),
  ),
  BlocProvider<MoreCubit>(
    create: (BuildContext context) => MoreCubit(),
  ),
  BlocProvider<TrueorfalseCubit>(
    create: (BuildContext context) => TrueorfalseCubit(),
  ),
  BlocProvider<MultiCubit>(
    create: (BuildContext context) => MultiCubit(),
  ),
  BlocProvider<OneCubit>(
    create: (BuildContext context) => OneCubit(),
  ),
  BlocProvider<SystemsCubit>(
    create: (BuildContext context) => SystemsCubit(),
  ),
  BlocProvider<FullanswearCubit>(
    create: (BuildContext context) => FullanswearCubit(),
  ),
  BlocProvider<PointsCubit>(
    create: (BuildContext context) => PointsCubit()..loadPoints(),
  ),
];
