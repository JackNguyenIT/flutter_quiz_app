import 'package:flutter/material.dart';

class TextAppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final bool isStretchWidth;

  const TextAppButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.isStretchWidth = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(isStretchWidth ? double.infinity : 0, 38),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18,
              color: Colors.white,
            ),
      ),
    );
  }
}
