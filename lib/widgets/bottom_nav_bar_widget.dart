import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Set the current index to highlight the selected tab
      onTap: onTabSelected, // Handle tab selection
      selectedItemColor: Colors.blue, // Use primary color for selected icon
      unselectedItemColor: Colors.grey, // Unselected icons will be grey
      backgroundColor: Colors.white, // Navigation bar with white background
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_sharp), // Dashboard icon from FontAwesome
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.utensils), // Recipes icon from FontAwesome
          label: 'My Meals',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.spoon), // Meal builder icon from FontAwesome
          label: 'Meal Builder',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.gears), // More icon from FontAwesome
          label: 'More',
        ),
      ],
    );
  }
}
