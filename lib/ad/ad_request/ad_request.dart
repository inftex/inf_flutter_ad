import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;

class AdRequest {
  Map<String, String>? extras;

  AdRequest({this.extras});

  gma.AdRequest toGmaAdRequest() {
    return gma.AdRequest(extras: extras);
  }
}
