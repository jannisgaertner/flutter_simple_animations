import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_simple_animations/flutter_simple_animations.dart';
import 'package:flutter_simple_animations/flutter_simple_animations_platform_interface.dart';
import 'package:flutter_simple_animations/flutter_simple_animations_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterSimpleAnimationsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterSimpleAnimationsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterSimpleAnimationsPlatform initialPlatform = FlutterSimpleAnimationsPlatform.instance;

  test('$MethodChannelFlutterSimpleAnimations is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterSimpleAnimations>());
  });

  test('getPlatformVersion', () async {
    FlutterSimpleAnimations flutterSimpleAnimationsPlugin = FlutterSimpleAnimations();
    MockFlutterSimpleAnimationsPlatform fakePlatform = MockFlutterSimpleAnimationsPlatform();
    FlutterSimpleAnimationsPlatform.instance = fakePlatform;

    expect(await flutterSimpleAnimationsPlugin.getPlatformVersion(), '42');
  });
}
