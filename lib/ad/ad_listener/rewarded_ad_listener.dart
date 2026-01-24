import 'package:inf_flutter_ad/ad/ad_listener/ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class RewardedAdListener extends AdListener {
  RewardedAdListener({
    Function(Ad ad)? onAdLoaded,
    Function(Ad ad, String error)? onAdFailedToLoad,
    Function(Ad ad)? onAdImpression,
    Function(Ad ad)? onAdClicked,
    Function(Ad ad)? onAdShowedFullScreenContent,
    Function(Ad ad, String error)? onAdFailedToShowFullScreenContent,
    Function(Ad ad)? onAdDismissedFullScreenContent,
  }) : super(
            onAdLoaded: onAdLoaded,
            onAdFailedToLoad: onAdFailedToLoad,
            onAdImpression: onAdImpression,
            onAdClicked: onAdClicked,
            onAdShowedFullScreenContent: onAdShowedFullScreenContent,
            onAdFailedToShowFullScreenContent:
                onAdFailedToShowFullScreenContent,
            onAdDismissedFullScreenContent: onAdDismissedFullScreenContent);
}
