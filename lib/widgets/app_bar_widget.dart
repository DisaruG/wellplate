import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const CustomAppBar({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Text(
        'Dashboard',
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black, // Dynamically set text color
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
            color: isDarkMode ? Colors.white : Colors.black, // Dynamically set icon color
          ),
          onPressed: toggleTheme,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
