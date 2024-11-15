import 'package:flutter/material.dart';

class DailyTipCard extends StatelessWidget {
  final String tip;

  const DailyTipCard({
    super.key,
    required this.tip, // The tip content passed as a parameter
  });

  // Define a method to get a color based on the tip's content
  Color _getCardColor(String tip) {
    if (tip.contains("water")) {
      return Colors.blue.shade100; // For hydration tips
    } else if (tip.contains("exercise")) {
      return Colors.green.shade100; // For exercise-related tips
    } else if (tip.contains("sleep")) {
      return Colors.purple.shade100; // For sleep-related tips
    } else if (tip.contains("stress")) {
      return Colors.orange.shade100; // For stress-related tips
    }
    // You can add more conditions for different tips here, or use a random color approach if desired
    return Colors.amber.shade100; // Default color if no conditions match
  }

  // Define a method to get an emoji based on the tip's content
  String _getTipEmoji(String tip) {
    if (tip.contains("water")) {
      return "💧"; // Emoji for hydration tips
    } else if (tip.contains("exercise")) {
      return "🏋️‍♀️"; // Emoji for exercise tips
    } else if (tip.contains("sleep")) {
      return "💤"; // Emoji for sleep tips
    } else if (tip.contains("stress")) {
      return "🧘‍♀️"; // Emoji for stress-related tips
    }
    return "🍏"; // Default emoji for health
  }

  @override
  Widget build(BuildContext context) {
    // Get the appropriate color for the card
    Color cardColor = _getCardColor(tip);
    // Get the appropriate emoji for the tip
    String emoji = _getTipEmoji(tip);

    return SizedBox(
      width: double.infinity, // Card takes full width
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: cardColor, // Set the background color
        child: Stack(
          children: [
            // Main content of the card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Vertically center the content
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                children: [
                  const Text(
                    "Daily Health Tip",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10), // Increased space between title and content
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          tip, // The health tip
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF333333),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Emoji placed at the top-right corner
            Positioned(
              top: 10, // Adjusted to make sure the emoji is not too close to the edges
              right: 10, // Adjusted for spacing from the right edge
              child: Text(
                emoji, // Emoji based on the health tip
                style: const TextStyle(
                  fontSize: 24, // Slightly smaller size for a balanced look
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
