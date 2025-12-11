import 'package:flutter/material.dart';
import 'package:inf_flutter_ad/ad/ad_size/ad_size.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;

class BannerAdSize extends AdSize {
  @override
  gma.AdSize toGmaAdSize() {
    return gma.AdSize.banner;
  }
}

class LargeBannerAdSize extends AdSize {
  @override
  gma.AdSize toGmaAdSize() {
    return gma.AdSize.largeBanner;
  }
}

class AdaptiveBannerAdSize extends AdSize {
  final gma.AdSize gmaAdSize;

  AdaptiveBannerAdSize({required this.gmaAdSize});

  @override
  gma.AdSize toGmaAdSize() {
    return gmaAdSize;
  }
}

Future<AdaptiveBannerAdSize?> createAdaptiveBannerAdSize(
    {required BuildContext context}) async {
  // Get the size before loading the ad.
  final size =
      await gma.AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
          MediaQuery.sizeOf(context).width.truncate());

  if (size == null) {
    return null;
  }
  return AdaptiveBannerAdSize(gmaAdSize: size);
}
