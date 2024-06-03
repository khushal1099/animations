import 'package:flutter/material.dart';

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({super.key});

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: AnimatedRotation(
                turns: turns,
                duration: Duration(seconds: 3),
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.red,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  turns += 1 / 4;
                });
              },
              child: Text("Rotate"),
            ),
          ],
        ),
      ),
    );
  }
}
