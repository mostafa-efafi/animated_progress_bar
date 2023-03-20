import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_progress_bar/animated_progress_bar_method_channel.dart';

void main() {
  MethodChannelAnimatedProgressBar platform = MethodChannelAnimatedProgressBar();
  const MethodChannel channel = MethodChannel('animated_progress_bar');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
