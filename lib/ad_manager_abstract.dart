import 'package:inf_flutter_ad/ad/ad_listener/app_open_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/banner_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/interstitial_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/native_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_listener/rewarded_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_size/ad_size.dart';
import 'package:inf_flutter_ad/ad/ad_template/ad_template.dart';

import 'ad/ad_type/ad.dart';
import 'ad/ad_request/ad_request.dart';

abstract class IAdManager {
  ///
  /// Initialize
  /// MUST be called on app startup
  ///
  void setup();

  ///
  /// Config test devices
  ///
  Future<void> configTestDevices({required List<String> deviceIds});

  ///
  /// Create banner object > load() > get its widget to show
  ///
  Ad createBannerAd({
    required String? adUnitId,
    AdSize? adSize,
    AdRequest? request,
    BannerAdListener? listener,
  });

  ///
  /// Create interstitial object > load() > show() onAdLoaded callback
  ///
  Ad createInterstitialAd({
    required String? adUnitId,
    AdRequest? request,
    InterstitialAdListener? listener,
  });

  ///
  /// load app open ad
  ///
  Ad createAppOpenAd({
    required String? adUnitId,
    AdRequest? request,
    AppOpenAdListener? listener,
  });

  ///
  /// Create rewarded object > load() > show() onAdLoaded callback
  ///
  Ad createRewardedAd({
    required String? adUnitId,
    AdRequest? request,
    RewardedAdListener? listener,
  });

  ///
  /// Create native ad object > load() > get its widget to show
  ///
  Ad createNativeAd({
    required String? adUnitId,
    AdTemplate? adTemplate,
    AdRequest? request,
    NativeAdListener? listener,
  });
}
