import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;

class AdSize {
  String type;

  AdSize({required this.type});

  gma.AdSize toGmaAdSize() {
    gma.AdSize gmaAdSize = gma.AdSize.banner;
    switch (type) {
      case AdSizeType.banner:
        gmaAdSize = gma.AdSize.banner;
        break;
      case AdSizeType.largerBanner:
        gmaAdSize = gma.AdSize.largeBanner;
        break;
    }
    return gmaAdSize;
  }
}

class AdSizeType {
  static const String banner = 'banner';
  static const String largerBanner = 'largerBanner';
}
