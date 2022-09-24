#include "include/flutter_simple_animations/flutter_simple_animations_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_simple_animations_plugin.h"

void FlutterSimpleAnimationsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_simple_animations::FlutterSimpleAnimationsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
