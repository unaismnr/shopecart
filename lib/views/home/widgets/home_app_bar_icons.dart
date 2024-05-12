import 'package:flutter/material.dart';

class HomeAppBarIcons extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const HomeAppBarIcons({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
