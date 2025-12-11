import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad_listener/banner_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';
import 'package:inf_flutter_ad/ad/ad_size/ad_size.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class BannerAd extends Ad {
  late gma.BannerAd _banner;

  String get _logPrefix => '[Banner]';

  BannerAd({
    required String adUnitId,
    AdRequest? request,
    AdSize? adSize,
    BannerAdListener? listener,
  }) : super(
          adUnitId: adUnitId,
          request: request,
          listener: listener,
        ) {
    _banner = gma.BannerAd(
      adUnitId: adUnitId,
      size: adSize?.toGmaAdSize() ?? gma.AdSize.banner,
      request: request?.toGmaAdRequest() ?? gma.AdRequest(),
      listener: gma.BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (gma.Ad ad) {
          debugPrint(
              '$_logPrefix Ad loaded: ${ad.responseInfo?.mediationAdapterClassName}');
          listener?.onAdLoaded?.call(this);
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (gma.Ad ad, gma.LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          debugPrint('$_logPrefix Ad failed to load: $error');
          listener?.onAdFailedToLoad?.call(this, error.toString());
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (gma.Ad ad) {
          debugPrint('$_logPrefix Ad opened.');
          listener?.onAdOpened?.call(this);
        },
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (gma.Ad ad) {
          debugPrint('$_logPrefix Ad closed.');
          listener?.onAdClosed?.call(this);
        },
        // Called when an impression occurs on the ad.
        onAdImpression: (gma.Ad ad) {
          debugPrint('$_logPrefix Ad impression.');
          listener?.onAdImpression?.call(this);
        },
      ),
    );
  }

  @override
  Widget get widget => Container(
        alignment: Alignment.center,
        width: _banner.size.width.toDouble(),
        height: _banner.size.height.toDouble(),
        child: gma.AdWidget(ad: _banner),
      );

  @override
  void load() {
    _banner.load();
  }

  @override
  void dispose() {
    _banner.dispose();
  }
}
