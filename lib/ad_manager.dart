import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad_listener/app_open_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/banner_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/interstitial_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/native_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/rewarded_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_size/ad_size.dart';
import 'package:inf_flutter_ad/ad/ad_template/ad_template.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';
import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';
import 'package:inf_flutter_ad/ad/ad_type/app_open_ad.dart';
import 'package:inf_flutter_ad/ad/ad_type/banner_ad.dart';
import 'package:inf_flutter_ad/ad/ad_type/interstitial_ad.dart';
import 'package:inf_flutter_ad/ad/ad_type/native_ad.dart';
import 'package:inf_flutter_ad/ad/ad_type/rewared_ad.dart';

import 'ad_manager_abstract.dart';

class AdManager extends IAdManager {
  String get _logPrefix => '[AdManager]';

  static AdManager? _instance;
  static AdManager get instance {
    _instance ??= AdManager._();
    return _instance!;
  }

  AdManager._();

  @override
  Future<void> setup({bool familySafe = false}) async {
    if (familySafe) {
      // Tell AdMob that the app targets children
      gma.RequestConfiguration requestConfiguration = gma.RequestConfiguration(
        tagForChildDirectedTreatment: gma.TagForChildDirectedTreatment.yes,
        maxAdContentRating: gma.MaxAdContentRating.g,
      );
      await gma.MobileAds.instance
          .updateRequestConfiguration(requestConfiguration);
    }

    final initializationStatus = await gma.MobileAds.instance.initialize();
    initializationStatus.adapterStatuses.forEach((key, value) {
      debugPrint(
          '$_logPrefix Adapter status for $key: ${value.description}, ${value.state}, ${value.latency}');
    });
  }

  @override
  Future<void> configTestDevices({required List<String> deviceIds}) async {
    await gma.MobileAds.instance.updateRequestConfiguration(
      gma.RequestConfiguration(
        testDeviceIds: deviceIds,
      ),
    );
  }

  @override
  Ad createBannerAd({
    required String? adUnitId,
    AdSize? adSize,
    AdRequest? request,
    BannerAdListener? listener,
  }) {
    return BannerAd(
        adUnitId: _getBannerAdUnitId(adUnitId),
        adSize: adSize,
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
  Ad createAppOpenAd(
      {required String? adUnitId,
      AdRequest? request,
      AppOpenAdListener? listener}) {
    return AppOpenAd(
        adUnitId: _getAppOpenAdUnitId(adUnitId),
        request: request,
        listener: listener);
  }

  @override
  Ad createRewardedAd(
      {required String? adUnitId,
      AdRequest? request,
      RewardedAdListener? listener}) {
    return RewaredAd(
        adUnitId: _getRewardedAdUnitId(adUnitId),
        request: request,
        listener: listener);
  }

  @override
  Ad createNativeAd(
      {required String? adUnitId,
      AdTemplate? adTemplate,
      AdRequest? request,
      NativeAdListener? listener}) {
    return NativeAd(
        adUnitId: _getNativeAdUnitId(adUnitId),
        adTemplate: adTemplate,
        request: request,
        listener: listener);
  }

  ///
  /// Sample ad unit id: https://developers.google.com/admob/android/test-ads#sample_ad_units
  ///
  String _getBannerAdUnitId(String? adUnitId) {
    if (kDebugMode || adUnitId == null) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/9214589741';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2435281174';
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
        return 'ca-app-pub-3940256099942544/9257395921';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/5575463023';
      }
    }
    return adUnitId!;
  }

  String _getRewardedAdUnitId(String? adUnitId) {
    if (kDebugMode || adUnitId == null) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/5224354917';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/1712485313';
      }
    }
    return adUnitId!;
  }

  String _getNativeAdUnitId(String? adUnitId) {
    if (kDebugMode || adUnitId == null) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/2247696110';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/3986624511';
      }
    }
    return adUnitId!;
  }
}
