import 'package:inf_flutter_ad/ad/ad_listener/ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class RewardedAdListener extends AdListener {
  final Function(Ad ad)? onAdShowedFullScreenContent;
  final Function(Ad ad)? onAdDismissedFullScreenContent;
  final Function(Ad ad, String error)? onAdFailedToShowFullScreenContent;
  final Function(Ad ad)? onAdClicked;

  RewardedAdListener(
      {Function(Ad ad)? onAdLoaded,
      Function(Ad ad, String error)? onAdFailedToLoad,
      this.onAdShowedFullScreenContent,
      this.onAdDismissedFullScreenContent,
      this.onAdFailedToShowFullScreenContent,
      this.onAdClicked,
      Function(Ad ad)? onAdImpression})
      : super(
            onAdLoaded: onAdLoaded,
            onAdFailedToLoad: onAdFailedToLoad,
            onAdImpression: onAdImpression);
}
