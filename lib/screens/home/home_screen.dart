import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false; // To manage theme state
  int _currentIndex = 0; // To track the selected tab index

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index; // Update the current tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
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
              onPressed: toggleTheme, // On press, toggle the theme
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'Welcome to the Dashboard',
            style: TextStyle(fontSize: 24),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // Set the current index to highlight the selected tab
          onTap: _onTabSelected, // Handle tab selection
          selectedItemColor: Colors.blue, // Use primary color for selected icon
          unselectedItemColor: Colors.grey, // Unselected icons will be grey
          backgroundColor: Colors.white, // Navigation bar with white background
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_sharp),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: 'Meal Builder',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}
