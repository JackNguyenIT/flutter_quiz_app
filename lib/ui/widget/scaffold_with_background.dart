import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScaffoldBackground extends StatelessWidget {
  const ScaffoldBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SvgPicture.asset(
          "assets/images/bg.svg",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        child
      ]),
    );
  }
}
