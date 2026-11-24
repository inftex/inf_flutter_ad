import 'package:google_mobile_ads/google_mobile_ads.dart';

enum ConsentGeography {
  /// Use the real device location (debug geography disabled).
  disabled,

  /// Simulate a user in the EEA.
  eea,

  /// Simulate a user in a regulated US state.
  regulatedUsState,

  /// Simulate a user in a region with no regulation.
  other;

  DebugGeography get sdkValue {
    switch (this) {
      case ConsentGeography.disabled:
        return DebugGeography.debugGeographyDisabled;
      case ConsentGeography.eea:
        return DebugGeography.debugGeographyEea;
      case ConsentGeography.regulatedUsState:
        return DebugGeography.debugGeographyRegulatedUsState;
      case ConsentGeography.other:
        return DebugGeography.debugGeographyOther;
    }
  }
}
