import 'package:inf_flutter_ad/ad/ad.dart';

abstract class AdListener {
  final Function(Ad ad)? onAdLoaded;
  final Function(Ad ad, String error)? onAdFailedToLoad;
  final Function(Ad ad)? onAdImpression;

  AdListener({
    this.onAdLoaded,
    this.onAdFailedToLoad,
    this.onAdImpression,
  });
}

class BannerAdListener extends AdListener {
  final Function(Ad ad)? onAdOpened;
  final Function(Ad ad)? onAdClosed;

  BannerAdListener(
      {Function(Ad ad)? onAdLoaded,
      Function(Ad ad, String error)? onAdFailedToLoad,
      this.onAdOpened,
      this.onAdClosed,
      Function(Ad ad)? onAdImpression})
      : super(
            onAdLoaded: onAdLoaded,
            onAdFailedToLoad: onAdFailedToLoad,
            onAdImpression: onAdImpression);
}

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
