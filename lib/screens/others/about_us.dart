import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza/bloc/more/more_cubit.dart';
import 'package:gaza/utils/mystyle.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});
  static const routeName = 'AboutUs';

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreCubit, MoreState>(builder: (context, state) {
      return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Mystyle.colodark,
          ));
    });
    // return const Placeholder(
    //   child: Text(
    //     'Data to check',
    //     textAlign: TextAlign.center,
    //   ),
    // );
  }
}
