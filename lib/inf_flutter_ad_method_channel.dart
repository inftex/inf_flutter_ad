import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'inf_flutter_ad_platform_interface.dart';

/// An implementation of [InfFlutterAdPlatform] that uses method channels.
class MethodChannelInfFlutterAd extends InfFlutterAdPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('inf_flutter_ad');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
