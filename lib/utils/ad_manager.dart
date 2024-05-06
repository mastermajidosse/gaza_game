// import 'package:flutter/foundation.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:gaza/utils/constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AdManager {
  // RewardedAd? rewardedAd;
  // SharedPreferences? prefs;
  // VoidCallback onUserEarnedReward;
  // AdManager({required this.onUserEarnedReward});

  // bool isUserEarnedReward = false;

  // void loadRewardedAd() async {
  //   await initPrefs();
  //   if (!canSeeNewAd()) {
  //     rewardedAd = null;
  //     return;
  //   }

  //   RewardedAd.load(
  //     adUnitId: Constants.rewardedIdtest,
  //     request: const AdRequest(),
  //     rewardedAdLoadCallback: RewardedAdLoadCallback(
  //       onAdLoaded: (RewardedAd ad) {
  //         debugPrint('$ad loaded.');
  //         // Keep a reference to the ad so you can show it later.
  //         rewardedAd = ad;
  //       },
  //       onAdFailedToLoad: (LoadAdError error) {
  //         debugPrint('RewardedAd failed to load: $error');
  //         rewardedAd = null;
  //       },
  //     ),
  //   );
  // }

  // showRewardedAd() {
  //   if (rewardedAd != null) {
  //     rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
  //       onAdShowedFullScreenContent: (RewardedAd ad) =>
  //           debugPrint('$ad onAdShowedFullScreenContent.'),
  //       onAdDismissedFullScreenContent: (RewardedAd ad) {
  //         debugPrint('$ad onAdDismissedFullScreenContent.');
  //         if (isUserEarnedReward) {
  //           isUserEarnedReward = false;
  //           // go to game screen again
  //           // Get.offNamed(GameScreen.routeName);

  //           // return user to level with 3 hearts
  //           onUserEarnedReward();
  //           // save seen ad date
  //           saveAdWatchDate();
  //         }
  //         ad.dispose();
  //       },
  //       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
  //         debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
  //         ad.dispose();
  //       },
  //       onAdImpression: (RewardedAd ad) =>
  //           debugPrint('$ad impression occurred.'),
  //     );

  //     rewardedAd!.show(
  //         onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
  //       // Reward the user for watching an ad.
  //       debugPrint(
  //           "onUserEarnedReward: ${rewardItem.amount} ${rewardItem.type}");

  //       isUserEarnedReward = true;
  //     });
  //   }
  // }

  // void disposeRewardedAd() {
  //   rewardedAd?.dispose();
  // }

  // Future initPrefs() async {
  //   prefs = await SharedPreferences.getInstance();
  //   debugPrint('Init Preferences');
  //   return true;
  // }

  // void saveAdWatchDate() {
  //   prefs!.setString('adWatchDate', DateTime.now().toString());
  // }

  // // allow user to see ad once every 6 hours
  // bool canSeeNewAd() {
  //   String? savedDate = prefs!.getString('adWatchDate');
  //   if (savedDate == null) {
  //     return true;
  //   }

  //   DateTime date = DateTime.parse(savedDate);
  //   int difference = DateTime.now().difference(date).inHours;
  //   debugPrint('diiff bwteen last seen ad and now: $difference');
  //   return difference > 6;
  // }
}
