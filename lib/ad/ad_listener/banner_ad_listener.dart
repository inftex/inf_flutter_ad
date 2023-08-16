import 'package:inf_flutter_ad/ad/ad_listener/ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

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
