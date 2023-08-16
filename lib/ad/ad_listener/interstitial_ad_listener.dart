import 'package:inf_flutter_ad/ad/ad_listener/ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class InterstitialAdListener extends AdListener {
  final Function(Ad ad)? onAdShowedFullScreenContent;
  final Function(Ad ad)? onAdDismissedFullScreenContent;
  final Function(Ad ad, String error)? onAdFailedToShowFullScreenContent;

  InterstitialAdListener(
      {Function(Ad ad)? onAdLoaded,
      Function(Ad ad, String error)? onAdFailedToLoad,
      this.onAdShowedFullScreenContent,
      this.onAdDismissedFullScreenContent,
      this.onAdFailedToShowFullScreenContent,
      Function(Ad ad)? onAdImpression})
      : super(
            onAdLoaded: onAdLoaded,
            onAdFailedToLoad: onAdFailedToLoad,
            onAdImpression: onAdImpression);
}
