import 'package:flutter_test/flutter_test.dart';
import 'package:inf_flutter_ad/inf_flutter_ad.dart';
import 'package:inf_flutter_ad/inf_flutter_ad_platform_interface.dart';
import 'package:inf_flutter_ad/inf_flutter_ad_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInfFlutterAdPlatform
    with MockPlatformInterfaceMixin
    implements InfFlutterAdPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InfFlutterAdPlatform initialPlatform = InfFlutterAdPlatform.instance;

  test('$MethodChannelInfFlutterAd is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInfFlutterAd>());
  });

  test('getPlatformVersion', () async {
    InfFlutterAd infFlutterAdPlugin = InfFlutterAd();
    MockInfFlutterAdPlatform fakePlatform = MockInfFlutterAdPlatform();
    InfFlutterAdPlatform.instance = fakePlatform;

    expect(await infFlutterAdPlugin.getPlatformVersion(), '42');
  });
}
