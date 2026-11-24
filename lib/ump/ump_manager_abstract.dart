import 'package:inf_flutter_ad/ump/geograohy/consent_geography.dart';

abstract class IUmpManager {
  Future<bool> gatherConsent(
      {List<String> testIdentifiers = const [],
      ConsentGeography? consentGeography});
}
