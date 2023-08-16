import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad_listener/app_open_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/banner_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/interstitial_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';
import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';
import 'package:inf_flutter_ad/ad/ad_type/app_open_ad.dart';
import 'package:inf_flutter_ad/ad/ad_type/banner_ad.dart';
import 'package:inf_flutter_ad/ad/ad_type/interstitial_ad.dart';

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

  @override
  Ad loadAppOpenAd(
      {required String? adUnitId,
      AdRequest? request,
      AppOpenAdListener? listener}) {
    return AppOpenAd(
        adUnitId: _getAppOpenAdUnitId(adUnitId),
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

  String _getAppOpenAdUnitId(String? adUnitId) {
    if (kDebugMode || adUnitId == null) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/3419835294';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/5662855259';
      }
    }
    return adUnitId!;
  }
}
