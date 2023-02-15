import 'ad/ad.dart';
import 'ad/ad_listener.dart';
import 'ad/ad_request.dart';

abstract class IAdManager {
  ///
  /// Initialize
  /// MUST be called on app startup
  ///
  void setup();

  ///
  /// Create banner object > load() > get its widget to show
  ///
  Ad createBannerAd({
    required String? adUnitId,
    AdRequest? request,
    BannerAdListener? listener,
  });

  ///
  /// Create interstitial object > load() > show() onAdLoaded callback
  ///
  Ad createInterstitialAd({
    required String? adUnitId,
    AdRequest? request,
    InterstitialAdListener? listener,
  });
}
