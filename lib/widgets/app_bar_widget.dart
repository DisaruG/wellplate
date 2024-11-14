import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  const CustomAppBar({
    Key? key,
    required this.isDarkMode,
    required this.toggleTheme,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60); // Height of the AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // AppBar with a white background
      title: const Text(
        'Dashboard',
        style: TextStyle(color: Colors.black), // Title on the left
      ),
      actions: [
        IconButton(
          icon: Icon(
            isDarkMode ? Icons.nightlight_round : Icons.wb_sunny, // Toggle icon
            color: Colors.black, // Icon color
          ),
          onPressed: () => toggleTheme(), // On press, toggle the theme
        ),
      ],
    );
  }
}
