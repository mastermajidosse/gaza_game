// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:gaza/bloc/feed/feed_cubit.dart';

// const String testDevice = 'ca-app-pub-3940256099942544/1033173712';

// const String interid = 'ca-app-pub-9331906778457556/9641107831';

// const int maxFailedLoadAttempts = 3;

// class Ads {
//   BannerAd? bannerAd;

//   static final Ads _ads = Ads._internal();
//   factory Ads() {
//     return _ads;
//   }

//   Ads._internal();
//   bool interstitialReady = false;
//   InterstitialAd? interstitialAd;

//   static final AdRequest request = AdRequest(
//     // testDevices: testDevice != null ? <String>[testDevice] : null,

//     keywords: <String>['playing', 'challenge', 'funny', 'love'],

//     contentUrl: 'http://foo.com/bar.html',
//     nonPersonalizedAds: true,
//   );

//   InterstitialAd? _interstitialAd;
//   int _numInterstitialLoadAttempts = 0;
//   bool userdata = false;

//   createInterstitialAd() {
//     print("userdata " + userdata.toString());
//     InterstitialAd.load(
//       adUnitId: testDevice,
//       // adUnitId: interid,
//       request: request,
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           print('$ad loaded');
//           _interstitialAd = ad;
//           _numInterstitialLoadAttempts = 0;
//           _interstitialAd!.setImmersiveMode(true);
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           print('InterstitialAd failed to load: $error.');
//           _numInterstitialLoadAttempts += 1;

//           _interstitialAd = null;
//           if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
//             createInterstitialAd();
//           }
//         },
//       ),
//     );
//   }

//   void showInterstitialAd(context, {List<dynamic>? dares, List<dynamic>? truth}) {
//     if (_interstitialAd == null) {
//       print('Warning: attempt to show interstitial before loaded.');
//       BlocProvider.of<FeedCubit>(context).aZero(context, dares!, truth!);
//       return;
//     }
//     _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (InterstitialAd ad) => print('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (InterstitialAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         createInterstitialAd();
//       },
//       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         createInterstitialAd();
//       },
//     );
//     _interstitialAd!.show().then((value) {
//       _interstitialAd = null;
//       BlocProvider.of<FeedCubit>(context).aZero(context, dares!, truth!);
//     });
//   }
// }
