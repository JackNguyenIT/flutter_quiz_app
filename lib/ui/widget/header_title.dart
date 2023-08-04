import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.0,
      width: double.infinity,
      child: Center(
        child: Text(title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 22.0,
                  color: Colors.white,
                )),
      ),
    );
  }
}
