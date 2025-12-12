import 'package:inf_flutter_ad/ad/ad_template/ad_template.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;

class SmallNativeAdTemplate extends AdTemplate {
  @override
  gma.TemplateType toGmaTemplateType() {
    return gma.TemplateType.small;
  }
}

class MediumNativeAdTemplate extends AdTemplate {
  @override
  gma.TemplateType toGmaTemplateType() {
    return gma.TemplateType.medium;
  }
}
