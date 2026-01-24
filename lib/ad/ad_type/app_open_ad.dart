import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad_listener/app_open_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class AppOpenAd extends Ad {
  late gma.AppOpenAd? _appOpen;

  String get _logPrefix => '[AppOpen]';

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
  void load() {
    gma.AppOpenAd.load(
      adUnitId: adUnitId,
      // orientation: gma.AppOpenAd.orientationPortrait,
      request: const gma.AdRequest(),
      adLoadCallback: gma.AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpen = ad;
          debugPrint(
              '$_logPrefix Ad loaded: ${ad.responseInfo?.mediationAdapterClassName}');
          listener?.onAdLoaded?.call(this);

          // prepare full screen content callback
          _appOpen?.fullScreenContentCallback = gma.FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) {
              debugPrint('$_logPrefix onAdShowedFullScreenContent');
              listener?.onAdShowedFullScreenContent?.call(this);
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint(
                  '$_logPrefix onAdFailedToShowFullScreenContent: $error');
              dispose();
              listener?.onAdFailedToShowFullScreenContent
                  ?.call(this, error.toString());
            },
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('$_logPrefix onAdDismissedFullScreenContent');
              dispose();
              listener?.onAdDismissedFullScreenContent?.call(this);
            },
          );
        },
        onAdFailedToLoad: (error) {
          debugPrint('$_logPrefix Ad failed to load: $error');
          listener?.onAdFailedToLoad?.call(this, error.toString());
        },
      ),
    );
  }

  @override
  void show({Function? onUserEarned}) {
    _appOpen?.show();
  }

  @override
  void dispose() {
    _appOpen?.dispose();
    _appOpen = null;
  }
}
