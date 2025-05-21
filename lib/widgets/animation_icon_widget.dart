import 'package:flutter/material.dart';

class AnimatedPulsingIcon extends StatefulWidget {
  final void Function()? onTap;
  const AnimatedPulsingIcon({super.key, this.onTap});

  @override
  State<AnimatedPulsingIcon> createState() => _AnimatedPulsingIconState();
}

class _AnimatedPulsingIconState extends State<AnimatedPulsingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 40, end: 68).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Center(
            child: Icon(
              Icons.circle_outlined,
              color: Colors.white,
              size: _animation.value,
            ),
          );
        },
      ),
    );
  }
}
