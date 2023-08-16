import 'package:inf_flutter_ad/ad/ad_listener/ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class AppOpenAdListener extends AdListener {
  AppOpenAdListener(
      {Function(Ad ad)? onAdLoaded,
      Function(Ad ad, String error)? onAdFailedToLoad,
      Function(Ad ad)? onAdImpression})
      : super(
            onAdLoaded: onAdLoaded,
            onAdFailedToLoad: onAdFailedToLoad,
            onAdImpression: onAdImpression);
}
