import 'package:flutter/material.dart';

class AbimationScreen extends StatefulWidget {
  const AbimationScreen({super.key});

  @override
  State<AbimationScreen> createState() => _AbimationScreenState();
}

class _AbimationScreenState extends State<AbimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _borderRadiusAnimation;
  late Animation<Color?> _colorAnimation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _widthAnimation = Tween<double>(begin: 0, end: 200)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _borderRadiusAnimation = Tween<double>(begin: 0.0, end: 50.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.green).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Center(
              child: Container(
                width: _widthAnimation.value,
                height: _widthAnimation.value,
                decoration: BoxDecoration(
                    color: _colorAnimation.value,
                    borderRadius:
                        BorderRadius.circular(_borderRadiusAnimation.value)),
              ),
            );
          }),
    );
  }
}
