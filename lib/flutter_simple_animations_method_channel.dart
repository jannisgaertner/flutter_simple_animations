import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_simple_animations_platform_interface.dart';

/// An implementation of [FlutterSimpleAnimationsPlatform] that uses method channels.
class MethodChannelFlutterSimpleAnimations extends FlutterSimpleAnimationsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_simple_animations');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
