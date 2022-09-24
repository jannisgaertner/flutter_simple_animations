import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_simple_animations/flutter_simple_animations_method_channel.dart';

void main() {
  MethodChannelFlutterSimpleAnimations platform = MethodChannelFlutterSimpleAnimations();
  const MethodChannel channel = MethodChannel('flutter_simple_animations');

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
