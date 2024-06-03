import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation colorAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animation = Tween(begin: 0.0, end: 200.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.red, end: Colors.yellow,).animate(animationController);
    animationController.addListener(() {
      print(animation.value);
      setState(() {});
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: Center(
            child: Hero(
              tag: "image",
              child: Image.network(
                "https://pagalfree.com/images/128Arjan%20Vailly%20-%20Animal%20128%20Kbps.jpg",
                height: animation.value,
                width: animation.value,
              ),
            ),
          ),
          color: colorAnimation.value,

        ),
      ),
    );
  }
}
