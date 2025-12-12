import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;

abstract class AdTemplate {
  gma.TemplateType toGmaTemplateType();
}
