
import 'flutter_simple_animations_platform_interface.dart';

class FlutterSimpleAnimations {
  Future<String?> getPlatformVersion() {
    return FlutterSimpleAnimationsPlatform.instance.getPlatformVersion();
  }
}
