import 'package:flutter/material.dart';
import 'package:zelda_guide/presentation/core/app_theme.dart';

class Glow extends StatelessWidget {
  const Glow({
    Key? key,
    required this.child,
    this.blurRadius = 12.0,
    this.spreadRadius = 8,
  }) : super(key: key);

  final Widget child;
  final double blurRadius;
  final double spreadRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: AppTheme.glow.withAlpha(100),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ],
      ),
      child: child,
    );
  }
}
