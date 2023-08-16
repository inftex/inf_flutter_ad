import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad_listener/app_open_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';
import 'package:inf_flutter_logger/logger.dart';

class AppOpenAd extends Ad {
  late gma.AppOpenAd _appOpen;

  String get _logPrefix => 'AppOpen';

  AppOpenAd({
    required String adUnitId,
    AdRequest? request,
    AppOpenAdListener? listener,
  }) : super(
          adUnitId: adUnitId,
          request: request,
          listener: listener,
        ) {}

  @override
  Widget get widget => const SizedBox();

  @override
  void load() {
    gma.AppOpenAd.load(
      adUnitId: adUnitId,
      orientation: gma.AppOpenAd.orientationPortrait,
      request: const gma.AdRequest(),
      adLoadCallback: gma.AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpen = ad;
          Logger.info('$_logPrefix Ad loaded.');
          listener?.onAdLoaded?.call(this);
        },
        onAdFailedToLoad: (error) {
          dispose();
          Logger.info('$_logPrefix Ad failed to load: $error');
          listener?.onAdFailedToLoad?.call(this, error.toString());
        },
      ),
    );
  }

  @override
  void dispose() {
    _appOpen.dispose();
  }
}
