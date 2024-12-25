import 'package:flutter/material.dart';

class SectionList extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsetsGeometry? titlePadding;

  const SectionList({
    super.key,
    required this.title,
    this.titlePadding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: titlePadding,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          child
        ],
      ),
    );
  }
}
