import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad_listener/banner_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';
import 'package:inf_flutter_logger/logger.dart';

class BannerAd extends Ad {
  late gma.BannerAd _banner;

  String get _logPrefix => 'Banner';

  BannerAd({
    required String adUnitId,
    AdRequest? request,
    BannerAdListener? listener,
  }) : super(
          adUnitId: adUnitId,
          request: request,
          listener: listener,
        ) {
    _banner = gma.BannerAd(
      adUnitId: adUnitId,
      size: gma.AdSize.banner,
      request: gma.AdRequest(),
      listener: gma.BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (gma.Ad ad) {
          Logger.info('$_logPrefix Ad loaded.');
          listener?.onAdLoaded?.call(this);
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (gma.Ad ad, gma.LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          Logger.info('$_logPrefix Ad failed to load: $error');
          listener?.onAdFailedToLoad?.call(this, error.toString());
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (gma.Ad ad) {
          Logger.info('$_logPrefix Ad opened.');
          listener?.onAdOpened?.call(this);
        },
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (gma.Ad ad) {
          Logger.info('$_logPrefix Ad closed.');
          listener?.onAdClosed?.call(this);
        },
        // Called when an impression occurs on the ad.
        onAdImpression: (gma.Ad ad) {
          Logger.info('$_logPrefix Ad impression.');
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
