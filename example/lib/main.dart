import 'package:animated_progress_bar/animated_progress_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated ProgressBar Example'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(

                      /// set the [width] and [height] of the displayable area
                      height: 150,
                      width: 150,
                      child: AnimatedProgressBar(
                        /// set progress bar [stroke]
                        stroke: 20,

                        /// set the [foreground color] of the progress bar
                        color: Colors.purple,

                        /// The progress bar style can be [stroke] or [fill]
                        style: PaintingStyle.stroke,

                        /// Percentage progress is a number between [0] and [1], for example, to display [50] percent of the graph, this number must be [0.5].
                        percentage: 1,
                      )),
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: AnimatedProgressBar(
                        stroke: 12,
                        style: PaintingStyle.stroke,
                        percentage: 0.8,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: AnimatedProgressBar(
                        stroke: 7,
                        color: Colors.cyan,
                        style: PaintingStyle.stroke,
                        percentage: 0.3,
                      )),
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: AnimatedProgressBar(
                        color: Colors.orange,
                        style: PaintingStyle.fill,
                        percentage: 0.1,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
