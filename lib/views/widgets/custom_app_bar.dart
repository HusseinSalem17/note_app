import 'package:flutter/material.dart';

import 'cutsom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onpressed});

  final String title;
  final IconData icon;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        const Spacer(),
        CustomIcon(
          onPressed: onpressed,
          icon: icon,
        ),
      ],
    );
  }
}
