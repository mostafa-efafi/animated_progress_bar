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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: AnimatedProgressBar(
                        stroke: 20,
                        color: Colors.purple,
                        style: PaintingStyle.stroke,
                      )),
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: AnimatedProgressBar(
                        stroke: 12,
                        style: PaintingStyle.stroke,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: AnimatedProgressBar(
                        stroke: 7,
                        color: Colors.cyan,
                        style: PaintingStyle.stroke,
                      )),
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: AnimatedProgressBar(
                        color: Colors.orange,
                        style: PaintingStyle.fill,
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
