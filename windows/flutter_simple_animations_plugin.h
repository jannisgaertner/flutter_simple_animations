#ifndef FLUTTER_PLUGIN_FLUTTER_SIMPLE_ANIMATIONS_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_SIMPLE_ANIMATIONS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_simple_animations {

class FlutterSimpleAnimationsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterSimpleAnimationsPlugin();

  virtual ~FlutterSimpleAnimationsPlugin();

  // Disallow copy and assign.
  FlutterSimpleAnimationsPlugin(const FlutterSimpleAnimationsPlugin&) = delete;
  FlutterSimpleAnimationsPlugin& operator=(const FlutterSimpleAnimationsPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_simple_animations

#endif  // FLUTTER_PLUGIN_FLUTTER_SIMPLE_ANIMATIONS_PLUGIN_H_
