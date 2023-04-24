import 'package:animated_progress_bar/src/view_state.dart';
import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  /// set progress bar [stroke]
  final double? stroke;

  /// The progress bar style can be [stroke] or [fill]
  final PaintingStyle? style;

  /// Percentage progress is a number between [0] and [1], for example, to display [50] percent of the graph, this number must be [0.5].
  final double percentage;

  /// set the [foreground color] of the progress bar
  final Color? color;
  const AnimatedProgressBar(
      {Key? key, this.stroke, this.style, this.color, required this.percentage})
      : super(key: key);

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with TickerProviderStateMixin {
  /// The [second progress], the percentage of which can be changed
  double _fraction = 0.0;

  /// animation of [second progress]
  late Animation<double> animation;

  /// The [first progress], the percentage of which cannot be changed and is completed up to 100% every time
  double _staticFraction = 0.0;

  /// animation of [first progress]
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
    /// disposed all AnimationControllers
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
    double progressValue = widget.percentage;
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

  /// The start of the second animation one second after the first animation
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
    return ViewState(
      color: widget.color,
      style: widget.style,
      staticFraction: _staticFraction,
      fraction: _fraction,
      stroke: widget.stroke,
    );
  }
}

@override
bool get wantKeepAlive => false;
