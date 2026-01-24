import 'package:inf_flutter_ad/ad/ad_listener/ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class InterstitialAdListener extends AdListener {
  InterstitialAdListener({
    Function(Ad ad)? onAdLoaded,
    Function(Ad ad, String error)? onAdFailedToLoad,
    Function(Ad ad)? onAdImpression,
    Function(Ad ad)? onAdShowedFullScreenContent,
    Function(Ad ad, String error)? onAdFailedToShowFullScreenContent,
    Function(Ad ad)? onAdDismissedFullScreenContent,
  }) : super(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: onAdFailedToLoad,
          onAdImpression: onAdImpression,
          onAdShowedFullScreenContent: onAdShowedFullScreenContent,
          onAdFailedToShowFullScreenContent: onAdFailedToShowFullScreenContent,
          onAdDismissedFullScreenContent: onAdDismissedFullScreenContent,
        );
}
