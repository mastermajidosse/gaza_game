import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gaza/bloc/provider_setup.dart';
import 'package:gaza/screens/others/splash.dart';
import 'utils/route_genetator.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  // await MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: bproviders,
      child: ScreenUtilInit(
          designSize: Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'Tarikh game',
              debugShowCheckedModeBanner: false,
              // change themes
              theme: ThemeData(
                primaryColor: Colors.black,
                fontFamily: 'boutros',
              ),
              onGenerateRoute: router.RoutGenerator.generateRout,
              initialRoute: Splashs.routeName,
            );
          }),
    );
  }
}
