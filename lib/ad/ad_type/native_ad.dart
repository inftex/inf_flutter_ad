import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as gma;
import 'package:inf_flutter_ad/ad/ad_listener/native_ad_listener.dart';
import 'package:inf_flutter_ad/ad/ad_request/ad_request.dart';
import 'package:inf_flutter_ad/ad/ad_template/ad_template.dart';
import 'package:inf_flutter_ad/ad/ad_template/native_ad_template.dart';
import 'package:inf_flutter_ad/ad/ad_type/ad.dart';

class NativeAd extends Ad {
  late gma.NativeAd _nativeAd;
  late AdTemplate? _adTemplate;

  String get _logPrefix => '[NativeAd]';

  NativeAd({
    required String adUnitId,
    AdRequest? request,
    AdTemplate? adTemplate,
    NativeAdListener? listener,
  }) : super(
          adUnitId: adUnitId,
          request: request,
          listener: listener,
        ) {
    _adTemplate = adTemplate;
    _nativeAd = gma.NativeAd(
        adUnitId: adUnitId,
        listener: gma.NativeAdListener(
          onAdLoaded: (ad) {
            debugPrint(
                '$_logPrefix Ad loaded: ${ad.responseInfo?.mediationAdapterClassName}');
            listener?.onAdLoaded?.call(this);
          },
          onAdFailedToLoad: (ad, error) {
            // Dispose the ad here to free resources.
            debugPrint('$_logPrefix Ad failed to load: $error');
            ad.dispose();
            listener?.onAdFailedToLoad?.call(this, error.toString());
          },
        ),
        request: const gma.AdRequest(),
        // Styling
        nativeTemplateStyle: gma.NativeTemplateStyle(
          // Required: Choose a template.
          templateType:
              adTemplate?.toGmaTemplateType() ?? gma.TemplateType.medium,
          // Optional: Customize the ad's style.
          mainBackgroundColor: Colors.white,
          // cornerRadius: 16,
          // callToActionTextStyle: gma.NativeTemplateTextStyle(
          //     textColor: Colors.cyan,
          //     backgroundColor: Colors.red,
          //     style: gma.NativeTemplateFontStyle.monospace,
          //     size: 16.0),
          // primaryTextStyle: gma.NativeTemplateTextStyle(
          //     textColor: Colors.red,
          //     backgroundColor: Colors.cyan,
          //     style: gma.NativeTemplateFontStyle.italic,
          //     size: 16.0),
          // secondaryTextStyle: gma.NativeTemplateTextStyle(
          //     textColor: Colors.green,
          //     backgroundColor: Colors.black,
          //     style: gma.NativeTemplateFontStyle.bold,
          //     size: 16.0),
          // tertiaryTextStyle: gma.NativeTemplateTextStyle(
          //     textColor: Colors.brown,
          //     backgroundColor: Colors.amber,
          //     style: gma.NativeTemplateFontStyle.normal,
          //     size: 16.0),
        ));
    ;
  }

  @override
  Widget get widget {
    // return gma.AdWidget(ad: _nativeAd);
    return Center(
      child: (_adTemplate is SmallNativeAdTemplate)
          ? ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 320, // minimum recommended width
                minHeight: 90, // minimum recommended height
                maxWidth: 400,
                maxHeight: 110,
              ),
              child: gma.AdWidget(ad: _nativeAd),
            )
          : ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 320, // minimum recommended width
                minHeight: 320, // minimum recommended height
                maxWidth: 400,
                maxHeight: 360,
              ),
              child: gma.AdWidget(ad: _nativeAd),
            ),
    );
  }

  @override
  void load() {
    _nativeAd.load();
  }

  @override
  void dispose() {
    _nativeAd.dispose();
  }
}
