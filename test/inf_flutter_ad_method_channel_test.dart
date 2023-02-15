import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inf_flutter_ad/inf_flutter_ad_method_channel.dart';

void main() {
  MethodChannelInfFlutterAd platform = MethodChannelInfFlutterAd();
  const MethodChannel channel = MethodChannel('inf_flutter_ad');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
