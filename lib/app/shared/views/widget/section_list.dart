import 'package:flutter/material.dart';

class SectionList extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsetsGeometry? titlePadding;

  const SectionList(
      {super.key, required this.child, required this.title, this.titlePadding});

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
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          child
        ],
      ),
    );
  }
}
