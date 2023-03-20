#include "include/animated_progress_bar/animated_progress_bar_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "animated_progress_bar_plugin.h"

void AnimatedProgressBarPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  animated_progress_bar::AnimatedProgressBarPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
