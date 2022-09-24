import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_simple_animations_method_channel.dart';

abstract class FlutterSimpleAnimationsPlatform extends PlatformInterface {
  /// Constructs a FlutterSimpleAnimationsPlatform.
  FlutterSimpleAnimationsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSimpleAnimationsPlatform _instance = MethodChannelFlutterSimpleAnimations();

  /// The default instance of [FlutterSimpleAnimationsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSimpleAnimations].
  static FlutterSimpleAnimationsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterSimpleAnimationsPlatform] when
  /// they register themselves.
  static set instance(FlutterSimpleAnimationsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
