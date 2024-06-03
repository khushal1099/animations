import 'package:flutter/material.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  var list = [150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      lowerBound: 0.5,
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: list
              .map(
                (e) => Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: e * animationController.value,
                    width: e * animationController.value,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(1.0 - animationController.value),
                      shape: BoxShape.circle
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
