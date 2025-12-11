import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';

class BannerAdRequest extends AdRequest {
  BannerAdRequest({Map<String, String>? extras}) : super(extras: extras);

  factory BannerAdRequest.collapsibleTop() {
    return BannerAdRequest(extras: {
      "collapsible": "top",
    });
  }

  factory BannerAdRequest.collapsibleBottom() {
    return BannerAdRequest(extras: {
      "collapsible": "bottom",
    });
  }
}
