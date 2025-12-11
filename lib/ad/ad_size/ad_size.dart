import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;

class AdSize {
  gma.AdSize toGmaAdSize() {
    gma.AdSize gmaAdSize = gma.AdSize.banner;
    return gmaAdSize;
  }
}
