#ifndef FLUTTER_PLUGIN_ANIMATED_PROGRESS_BAR_PLUGIN_H_
#define FLUTTER_PLUGIN_ANIMATED_PROGRESS_BAR_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace animated_progress_bar {

class AnimatedProgressBarPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AnimatedProgressBarPlugin();

  virtual ~AnimatedProgressBarPlugin();

  // Disallow copy and assign.
  AnimatedProgressBarPlugin(const AnimatedProgressBarPlugin&) = delete;
  AnimatedProgressBarPlugin& operator=(const AnimatedProgressBarPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace animated_progress_bar

#endif  // FLUTTER_PLUGIN_ANIMATED_PROGRESS_BAR_PLUGIN_H_
