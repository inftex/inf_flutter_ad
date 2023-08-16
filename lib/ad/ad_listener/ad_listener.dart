import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

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
