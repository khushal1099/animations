import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SpringAnimation extends StatefulWidget {
  const SpringAnimation({super.key});

  @override
  State<SpringAnimation> createState() => _SpringAnimationState();
}

class _SpringAnimationState extends State<SpringAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late SpringSimulation springSimulation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: double.infinity,
    );

    springSimulation = SpringSimulation(
      SpringDescription(mass: 1, stiffness: 20, damping: 1.5),
      0,
      500,
      0,
    );

    animationController.animateWith(springSimulation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(150, animationController.value),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
