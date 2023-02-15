import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'inf_flutter_ad_method_channel.dart';

abstract class InfFlutterAdPlatform extends PlatformInterface {
  /// Constructs a InfFlutterAdPlatform.
  InfFlutterAdPlatform() : super(token: _token);

  static final Object _token = Object();

  static InfFlutterAdPlatform _instance = MethodChannelInfFlutterAd();

  /// The default instance of [InfFlutterAdPlatform] to use.
  ///
  /// Defaults to [MethodChannelInfFlutterAd].
  static InfFlutterAdPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InfFlutterAdPlatform] when
  /// they register themselves.
  static set instance(InfFlutterAdPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
