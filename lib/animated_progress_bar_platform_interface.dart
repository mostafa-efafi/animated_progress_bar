import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'animated_progress_bar_method_channel.dart';

abstract class AnimatedProgressBarPlatform extends PlatformInterface {
  /// Constructs a AnimatedProgressBarPlatform.
  AnimatedProgressBarPlatform() : super(token: _token);

  static final Object _token = Object();

  static AnimatedProgressBarPlatform _instance = MethodChannelAnimatedProgressBar();

  /// The default instance of [AnimatedProgressBarPlatform] to use.
  ///
  /// Defaults to [MethodChannelAnimatedProgressBar].
  static AnimatedProgressBarPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AnimatedProgressBarPlatform] when
  /// they register themselves.
  static set instance(AnimatedProgressBarPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
