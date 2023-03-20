
import 'animated_progress_bar_platform_interface.dart';

class AnimatedProgressBar {
  Future<String?> getPlatformVersion() {
    return AnimatedProgressBarPlatform.instance.getPlatformVersion();
  }
}
