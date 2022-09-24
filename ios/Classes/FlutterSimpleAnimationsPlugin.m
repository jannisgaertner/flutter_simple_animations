#import "FlutterSimpleAnimationsPlugin.h"
#if __has_include(<flutter_simple_animations/flutter_simple_animations-Swift.h>)
#import <flutter_simple_animations/flutter_simple_animations-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_simple_animations-Swift.h"
#endif

@implementation FlutterSimpleAnimationsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSimpleAnimationsPlugin registerWithRegistrar:registrar];
}
@end
