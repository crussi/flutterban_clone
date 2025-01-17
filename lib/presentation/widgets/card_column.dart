import 'package:flutter/material.dart';

class CardColumn extends StatelessWidget {
  const CardColumn({
    super.key,
    this.child,
    this.width = 300,
    this.borderRadius = 10,
    this.backgroundColor = Colors.white,
  });

  final Widget? child;
  final double? width;
  final double borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      //margin: const EdgeInsets.only(bottom: 20.0),
      width: width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black12,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
