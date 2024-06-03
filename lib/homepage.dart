import 'dart:async';

import 'package:animations/detailpage.dart';
import 'package:animations/ripple%20animation.dart';
import 'package:animations/rotation%20animation.dart';
import 'package:animations/spring%20animation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFade = true;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () {
        reload();
      },
    );
  }

  void reload() {
    setState(() {
      isFade = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailPage();
                    },
                  ),
                );
              },
              child: Hero(
                tag: "image",
                child: Image.network(
                  "https://pagalfree.com/images/128Arjan%20Vailly%20-%20Animal%20128%20Kbps.jpg",
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SpringAnimation();
                    },
                  ),
                );
              },
              child: AnimatedCrossFade(
                firstChild: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                ),
                secondChild: Image.network(
                  "https://pagalfree.com/images/128Arjan%20Vailly%20-%20Animal%20128%20Kbps.jpg",
                  height: 100,
                  width: 100,
                ),
                crossFadeState: isFade
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 3),
                sizeCurve: Curves.fastOutSlowIn,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RippleAnimation();
                  },
                ),
              );
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RotationAnimation();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
