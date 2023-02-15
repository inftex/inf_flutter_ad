import 'inf_flutter_ad_platform_interface.dart';

class InfFlutterAd {
  Future<String?> getPlatformVersion() {
    return InfFlutterAdPlatform.instance.getPlatformVersion();
  }
}
