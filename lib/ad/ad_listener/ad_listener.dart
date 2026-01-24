import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

abstract class AdListener {
  final Function(Ad ad)? onAdLoaded;
  final Function(Ad ad, String error)? onAdFailedToLoad;
  final Function(Ad ad)? onAdImpression;
  final Function(Ad ad)? onAdOpened;
  final Function(Ad ad)? onAdClosed;
  final Function(Ad ad)? onAdClicked;
  final Function(Ad ad)? onAdShowedFullScreenContent;
  final Function(Ad ad, String error)? onAdFailedToShowFullScreenContent;
  final Function(Ad ad)? onAdDismissedFullScreenContent;

  AdListener({
    this.onAdLoaded,
    this.onAdFailedToLoad,
    this.onAdImpression,
    this.onAdOpened,
    this.onAdClosed,
    this.onAdClicked,
    this.onAdShowedFullScreenContent,
    this.onAdFailedToShowFullScreenContent,
    this.onAdDismissedFullScreenContent,
  });
}
