import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;

import 'ad_listener.dart';
import 'ad_request.dart';

abstract class Ad {
  final String adUnitId;
  final AdRequest? request;
  final AdListener? listener;

  Ad({
    required this.adUnitId,
    this.request,
    this.listener,
  });

  Widget get widget => const SizedBox();
  void load();
  void show() {}
  void dispose();
}

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
          print('$_logPrefix Ad loaded.');
          listener?.onAdLoaded?.call(this);
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (gma.Ad ad, gma.LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('$_logPrefix Ad failed to load: $error');
          listener?.onAdFailedToLoad?.call(this, error.toString());
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (gma.Ad ad) {
          print('$_logPrefix Ad opened.');
          listener?.onAdOpened?.call(this);
        },
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (gma.Ad ad) {
          print('$_logPrefix Ad closed.');
          listener?.onAdClosed?.call(this);
        },
        // Called when an impression occurs on the ad.
        onAdImpression: (gma.Ad ad) {
          print('$_logPrefix Ad impression.');
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

class InterstitialAd extends Ad {
  gma.InterstitialAd? _interstitialAd;

  InterstitialAd({
    required String adUnitId,
    AdRequest? request,
    InterstitialAdListener? listener,
  }) : super(adUnitId: adUnitId, request: request, listener: listener);

  String get _logPrefix => 'Interstitial';

  @override
  void load() {
    gma.InterstitialAd.load(
        adUnitId: adUnitId,
        request: gma.AdRequest(),
        adLoadCallback: gma.InterstitialAdLoadCallback(
          onAdLoaded: (gma.InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
            print('$_logPrefix Ad loaded.');
            listener?.onAdLoaded?.call(this);

            _interstitialAd?.fullScreenContentCallback =
                gma.FullScreenContentCallback(
              onAdShowedFullScreenContent: (gma.InterstitialAd ad) {
                print('$_logPrefix %ad onAdShowedFullScreenContent.');
                (listener as InterstitialAdListener?)
                    ?.onAdShowedFullScreenContent
                    ?.call(this);
              },
              onAdDismissedFullScreenContent: (gma.InterstitialAd ad) {
                print('$_logPrefix $ad onAdDismissedFullScreenContent.');
                ad.dispose();
                (listener as InterstitialAdListener?)
                    ?.onAdDismissedFullScreenContent
                    ?.call(this);
              },
              onAdFailedToShowFullScreenContent:
                  (gma.InterstitialAd ad, gma.AdError error) {
                print(
                    '$_logPrefix $ad onAdFailedToShowFullScreenContent: $error');
                ad.dispose();
                (listener as InterstitialAdListener?)
                    ?.onAdFailedToShowFullScreenContent
                    ?.call(this, error.toString());
              },
              onAdImpression: (gma.InterstitialAd ad) {
                print('$_logPrefix $ad impression occurred.');
                listener?.onAdImpression?.call(this);
              },
            );
          },
          onAdFailedToLoad: (gma.LoadAdError error) {
            listener?.onAdFailedToLoad?.call(this, error.toString());
          },
        ));
  }

  @override
  void show() {
    _interstitialAd?.show();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
  }
}
