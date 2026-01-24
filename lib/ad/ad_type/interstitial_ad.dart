import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad_listener/interstitial_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class InterstitialAd extends Ad {
  gma.InterstitialAd? _interstitialAd;

  InterstitialAd({
    required String adUnitId,
    AdRequest? request,
    InterstitialAdListener? listener,
  }) : super(adUnitId: adUnitId, request: request, listener: listener);

  String get _logPrefix => '[Interstitial]';

  @override
  void load() {
    gma.InterstitialAd.load(
        adUnitId: adUnitId,
        request: gma.AdRequest(),
        adLoadCallback: gma.InterstitialAdLoadCallback(
          onAdLoaded: (gma.InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
            debugPrint(
                '$_logPrefix Ad loaded: ${ad.responseInfo?.mediationAdapterClassName}');
            listener?.onAdLoaded?.call(this);

            _interstitialAd?.fullScreenContentCallback =
                gma.FullScreenContentCallback(
              onAdShowedFullScreenContent: (gma.InterstitialAd ad) {
                debugPrint('$_logPrefix %ad onAdShowedFullScreenContent.');
                listener?.onAdShowedFullScreenContent?.call(this);
              },
              onAdDismissedFullScreenContent: (gma.InterstitialAd ad) {
                debugPrint('$_logPrefix $ad onAdDismissedFullScreenContent.');
                ad.dispose();
                listener?.onAdDismissedFullScreenContent?.call(this);
              },
              onAdFailedToShowFullScreenContent:
                  (gma.InterstitialAd ad, gma.AdError error) {
                debugPrint(
                    '$_logPrefix $ad onAdFailedToShowFullScreenContent: $error');
                ad.dispose();
                listener?.onAdFailedToShowFullScreenContent
                    ?.call(this, error.toString());
              },
              onAdImpression: (gma.InterstitialAd ad) {
                debugPrint('$_logPrefix $ad impression occurred.');
                listener?.onAdImpression?.call(this);
              },
            );
          },
          onAdFailedToLoad: (gma.LoadAdError error) {
            listener?.onAdFailedToLoad?.call(this, error.toString());
          },
        ));
  }

  @override
  void show({Function? onUserEarned}) {
    _interstitialAd?.show();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
  }
}
