import 'package:animated_progress_bar/src/view.dart';
import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  final double? stroke;
  final PaintingStyle? style;
  const AnimatedProgressBar({Key? key, this.stroke, this.style})
      : super(key: key);

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with TickerProviderStateMixin {
  double _fraction = 0.0;
  late Animation<double> animation;
  double _staticFraction = 0.0;
  late Animation<double> staticAnimation;
  late AnimationController _staticController;
  late AnimationController _controller;

  @override
  void initState() {
    _runAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _fraction = 0.0;
    _staticFraction = 0.0;
    if (_staticController.isCompleted && _controller.isCompleted) {
      _staticController.dispose();
      _controller.dispose();
    }
    super.dispose();
  }

  /// [animation controller]  for second animation (real progress)
  AnimationController _initController2({double? progressVal}) {
    double progressValue = progressVal ?? 1 /* ?? widget.progress.data! */;
    var controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 0.0, end: progressValue).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuart))
      ..addListener(() {
        if (mounted) {
          setState(() {
            _fraction = animation.value;
          });
        }
      });
    return controller;
  }

  AnimationController _initController1() {
    var staticController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    staticAnimation = Tween(begin: 0.0, end: 1.0).animate(staticController)
      ..addListener(() {
        if (mounted) {
          setState(() {
            _staticFraction = staticAnimation.value;
          });
        }
      });
    return staticController;
  }

  void _runAnimation() {
    _staticController = _initController1();
    _controller = _initController2(progressVal: 1);
    Future.delayed(const Duration(seconds: 1), () {
      _staticController.forward();
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return View(
      style: widget.style,
      staticFraction: _staticFraction,
      fraction: _fraction,
      stroke: widget.stroke,
    );
  }
}

@override
bool get wantKeepAlive => false;
