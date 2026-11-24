import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:inf_flutter_ad/ump/geograohy/consent_geography.dart';
import 'package:inf_flutter_ad/ump/ump_manager_abstract.dart';

final umpManager = UmpManager();

class UmpManager extends IUmpManager {
  @override
  Future<bool> gatherConsent(
      {List<String> testIdentifiers = const [],
      ConsentGeography? consentGeography}) async {
    final completer = Completer<void>();

    ConsentInformation.instance.requestConsentInfoUpdate(
      ConsentRequestParameters(
          consentDebugSettings: ConsentDebugSettings(
        debugGeography: consentGeography?.sdkValue,
        testIdentifiers: testIdentifiers,
      )),
      () {
        ConsentForm.loadAndShowConsentFormIfRequired((formError) {
          if (formError != null) {
            debugPrint('${formError.errorCode}: ${formError.message}');
          }
          completer.complete();
        });
      },
      (FormError error) {
        debugPrint('${error.errorCode}: ${error.message}');
        completer.complete();
      },
    );

    await completer.future;
    return ConsentInformation.instance.canRequestAds();
  }
}
