import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;  // Add a title parameter to make it dynamic

  const CustomAppBar({super.key, required this.title});  // Constructor to accept title

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        title,  // Use the dynamic title
        style: const TextStyle(
          color: Colors.black,  // Static color for the text
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
