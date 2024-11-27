import 'dart:io';
import 'package:inf_flutter_ad/ad/ad_listener/app_open_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/banner_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/interstitial_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';
import 'package:inf_flutter_ad/ad_manager.dart';

class AdUnit {
  static const String iosBanner = "";
  static const String iosInterstitial = "";
  static const String iosAppOpen = "";
  static const String androidBanner = "";
  static const String androidInterstitial = "";
  static const String androidAppOpen = "";
}

AdService adSv = AdService();

class AdService {
  void setup() {
    AdManager.instance.setup();
  }

  void showAppOpenAd() async {
    AdManager.instance
        .createAppOpenAd(
            adUnitId: getAppOpenAdId,
            listener: AppOpenAdListener(onAdLoaded: (ad) {
              ad.show();
            }))
        .load();
  }

  void showBannerAd({required Function(Ad ad) onLoaded}) async {
    AdManager.instance
        .createBannerAd(
            adUnitId: getBannerId,
            listener: BannerAdListener(onAdLoaded: (ad) {
              // ad.show();
              onLoaded.call(ad);
            }))
        .load();
  }

  void showInterstitialAd() async {
    AdManager.instance
        .createInterstitialAd(
            adUnitId: getInterstitialAdId,
            listener: InterstitialAdListener(onAdLoaded: (ad) {
              ad.show();
            }))
        .load();
  }

  String get getAppOpenAdId {
    if (Platform.isAndroid) {
      return AdUnit.androidAppOpen;
    }
    return AdUnit.iosAppOpen;
  }

  String get getBannerId {
    if (Platform.isAndroid) {
      return AdUnit.androidBanner;
    }
    return AdUnit.iosBanner;
  }

  String get getInterstitialAdId {
    if (Platform.isAndroid) {
      return AdUnit.androidInterstitial;
    }
    return AdUnit.iosInterstitial;
  }
}
