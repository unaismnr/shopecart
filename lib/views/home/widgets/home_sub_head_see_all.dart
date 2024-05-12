import 'package:flutter/material.dart';

class HomeSubHeadAndSeeAll extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const HomeSubHeadAndSeeAll({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text('See All'),
        ),
      ],
    );
  }
}
