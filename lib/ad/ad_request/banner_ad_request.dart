import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';

class CollapsibleTopBannerAdRequest extends AdRequest {
  @override
  gma.AdRequest toGmaAdRequest() {
    return const gma.AdRequest(extras: {
      "collapsible": "top",
    });
  }
}

class CollapsibleBottomBannerAdRequest extends AdRequest {
  @override
  gma.AdRequest toGmaAdRequest() {
    return const gma.AdRequest(extras: {
      "collapsible": "bottom",
    });
  }
}
