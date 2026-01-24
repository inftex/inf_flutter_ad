import 'package:inf_flutter_ad/ad/ad_listener/ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class BannerAdListener extends AdListener {
  BannerAdListener({
    Function(Ad ad)? onAdLoaded,
    Function(Ad ad, String error)? onAdFailedToLoad,
    Function(Ad ad)? onAdImpression,
    Function(Ad ad)? onAdOpened,
    Function(Ad ad)? onAdClosed,
  }) : super(
            onAdLoaded: onAdLoaded,
            onAdFailedToLoad: onAdFailedToLoad,
            onAdImpression: onAdImpression,
            onAdOpened: onAdOpened,
            onAdClosed: onAdClosed);
}
