import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  final Widget child;

  const CustomFadingWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 750,
      ),
    );

    animation = Tween<double>(
      begin: 0.1,
      end: 0.9,
    ).animate(
      animationController,
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(
      reverse: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
