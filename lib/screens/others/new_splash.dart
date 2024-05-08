import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/systems/systems_cubit.dart';
import 'package:gaza/screens/others/continue.dart';
import 'package:gaza/screens/others/menu.dart';
import 'package:gaza/utils/route_genetator.dart';
import 'package:lottie/lottie.dart';

class NewSplash extends StatefulWidget {
  static const routeName = 'NewSplash';
  const NewSplash({super.key});

  @override
  State<NewSplash> createState() => _NewSplashState();
}

class _NewSplashState extends State<NewSplash>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5)).then((_) {
      // BlocProvider.of<SystemsCubit>(context).clear();

      BlocProvider.of<SystemsCubit>(context).initiateit();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContinueScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
