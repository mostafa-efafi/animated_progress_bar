// import 'package:flutter_test/flutter_test.dart';
// import 'package:animated_progress_bar/animated_progress_bar.dart';
// import 'package:animated_progress_bar/animated_progress_bar_platform_interface.dart';
// import 'package:animated_progress_bar/animated_progress_bar_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockAnimatedProgressBarPlatform
//     with MockPlatformInterfaceMixin
//     implements AnimatedProgressBarPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final AnimatedProgressBarPlatform initialPlatform = AnimatedProgressBarPlatform.instance;

//   test('$MethodChannelAnimatedProgressBar is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelAnimatedProgressBar>());
//   });

//   test('getPlatformVersion', () async {
//     AnimatedProgressBar animatedProgressBarPlugin = AnimatedProgressBar();
//     MockAnimatedProgressBarPlatform fakePlatform = MockAnimatedProgressBarPlatform();
//     AnimatedProgressBarPlatform.instance = fakePlatform;

//     expect(await animatedProgressBarPlugin.getPlatformVersion(), '42');
//   });
// }
