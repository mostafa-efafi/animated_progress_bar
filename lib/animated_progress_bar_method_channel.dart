import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'animated_progress_bar_platform_interface.dart';

/// An implementation of [AnimatedProgressBarPlatform] that uses method channels.
class MethodChannelAnimatedProgressBar extends AnimatedProgressBarPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('animated_progress_bar');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
