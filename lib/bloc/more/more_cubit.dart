import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:gaza/models/games.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreInitial());

  // -------------------
  List<Games> allgame = [];

  getallgame() async {
    // emit(MoreLoading());
    // try {
    //   allgame = await getdata.fetchallg().whenComplete(() {
    //     print("hila");

    //     emit(MoreLoaded(allgame));
    //   });
    // } catch (e) {
    //   print(e.toString());
    //   emit(MoreError(e.toString()));
    // }
    emit(MoreLoaded(fake));
  }

  // === fake ===

  List<Games> fake = [
    Games(
      name: "تحدي ام حقيقة",
      downloads: 100000,
      link: "https://play.google.com/store/apps/details?id=com.otot.tahadi_saraha",
      icon:
          "https://play-lh.googleusercontent.com/so4nJMnIbpkegWn_4FgQvxJs1RxOXBaYJL_mzZVt5wDWaDldlKQQ2-Z8nJL8tCjWgw=s128",
      id: 1,
      lang: "عربي",
    ),
    Games(
      name: "لو خيروك",
      downloads: 27000,
      link: "https://play.google.com/store/apps/details?id=com.otot.lawkhayarouk",
      icon:
          "https://play-lh.googleusercontent.com/EzCaF5qdzLQKX76YQ227k9sX_A0CdS6IsMJ07g1dGmXopfid44yaal_zegn2sTplGQ=s128",
      id: 1,
      lang: "عربي",
    ),
    Games(
      name: "محرك",
      downloads: 5500,
      link: "https://play.google.com/store/apps/details?id=com.otot.moharik",
      icon:
          "https://play-lh.googleusercontent.com/mkPpZoNlHRt5xopuO1gIlM0htYRsGWOAzWJMJHXa-OgTE1hBG7XaWcShGV9YZNVc5IM=w240-h480",
      id: 1,
      lang: "عربي",
    ),
  ];
}
