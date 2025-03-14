import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad_listener/rewarded_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class RewaredAd extends Ad {
  gma.RewardedAd? _rewardedAd;

  RewaredAd({
    required String adUnitId,
    AdRequest? request,
    RewardedAdListener? listener,
  }) : super(adUnitId: adUnitId, request: request, listener: listener);

  String get _logPrefix => '[Rewarded]';

  @override
  void load() {
    gma.RewardedAd.load(
        adUnitId: adUnitId,
        request: gma.AdRequest(),
        rewardedAdLoadCallback: gma.RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = gma.FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {
              debugPrint('$_logPrefix %ad onAdShowedFullScreenContent.');
              (listener as RewardedAdListener?)
                  ?.onAdShowedFullScreenContent
                  ?.call(this);
            },
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {
              debugPrint('$_logPrefix %ad onAdImpression.');
              (listener as RewardedAdListener?)?.onAdImpression?.call(this);
            },
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
              // Dispose the ad here to free resources.
              ad.dispose();
              debugPrint('$_logPrefix %ad onAdFailedToShowFullScreenContent.');
              (listener as RewardedAdListener?)
                  ?.onAdFailedToShowFullScreenContent
                  ?.call(this, err.toString());
            },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
              // Dispose the ad here to free resources.
              ad.dispose();
              debugPrint('$_logPrefix %ad onAdDismissedFullScreenContent.');
              (listener as RewardedAdListener?)
                  ?.onAdDismissedFullScreenContent
                  ?.call(this);
            },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {
              debugPrint('$_logPrefix %ad onAdClicked.');
              (listener as RewardedAdListener?)?.onAdClicked?.call(this);
            });

            debugPrint('$_logPrefix Ad loaded.');
            _rewardedAd = ad;
            listener?.onAdLoaded?.call(this);
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (gma.LoadAdError error) {
            debugPrint('$_logPrefix Ad failed to load.');
            listener?.onAdFailedToLoad?.call(this, error.toString());
          },
        ));
  }

  @override
  void show({Function? onUserEarned}) {
    _rewardedAd?.show(
        onUserEarnedReward: (gma.AdWithoutView ad, gma.RewardItem rewardItem) {
      onUserEarned?.call();
    });
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
  }
}
