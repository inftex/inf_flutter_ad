import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;

class AdTemplate {
  String type;

  AdTemplate({required this.type});

  gma.TemplateType toGmaAdTemplateType() {
    gma.TemplateType gmaType = gma.TemplateType.medium;
    switch (type) {
      case AdTemplateType.small:
        gmaType = gma.TemplateType.small;
        break;
      case AdTemplateType.medium:
        gmaType = gma.TemplateType.medium;
        break;
    }
    return gmaType;
  }
}

class AdTemplateType {
  static const String medium = 'medium';
  static const String small = 'small';
}
