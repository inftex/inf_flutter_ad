import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad.dart';
import 'package:inf_flutter_ad/ad/ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_request.dart';

import 'ad_manager_abstract.dart';

class AdManager extends IAdManager {
  static AdManager? _instance;
  static AdManager get instance {
    _instance ??= AdManager._();
    return _instance!;
  }

  AdManager._();

  @override
  void setup() {
    gma.MobileAds.instance.initialize();
  }

  @override
  Ad createBannerAd({
    required String? adUnitId,
    AdRequest? request,
    BannerAdListener? listener,
  }) {
    return BannerAd(
        adUnitId: _getBannerAdUnitId(adUnitId),
        request: request,
        listener: listener);
  }

  @override
  Ad createInterstitialAd(
      {required String? adUnitId,
      AdRequest? request,
      InterstitialAdListener? listener}) {
    return InterstitialAd(
        adUnitId: _getInterstitialAdUnitId(adUnitId),
        request: request,
        listener: listener);
  }

  ///
  /// Sample ad unit id: https://developers.google.com/admob/android/test-ads#sample_ad_units
  ///
  String _getBannerAdUnitId(String? adUnitId) {
    if (kDebugMode || adUnitId == null) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/6300978111';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      }
    }
    return adUnitId!;
  }

  String _getInterstitialAdUnitId(String? adUnitId) {
    if (kDebugMode || adUnitId == null) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/1033173712';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/4411468910';
      }
    }
    return adUnitId!;
  }
}
