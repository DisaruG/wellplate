import 'package:flutter/material.dart';

class DailyTipCard extends StatelessWidget {
  final String tip;

  const DailyTipCard({
    super.key,
    required this.tip, // The tip content passed as a parameter
  });

  // Define a method to get a color based on the tip's content
  Color _getCardColor(String tip, BuildContext context) {
    // You can define more sophisticated logic based on your tips
    if (tip.contains("water")) {
      return Colors.blue.shade100; // For hydration tips
    } else if (tip.contains("exercise")) {
      return Colors.green.shade100; // For exercise-related tips
    } else if (tip.contains("sleep")) {
      return Colors.purple.shade100; // For sleep-related tips
    } else if (tip.contains("stress")) {
      return Colors.orange.shade100; // For stress-related tips
    }
    // Default color for other tips
    return Colors.teal.shade100;
  }

  // Define a method to get the color for the "Daily Health Tip" heading
  Color _getHeadingTextColor(BuildContext context, Color cardColor) {
    // If the card color is light, keep the text dark, else keep the text light for contrast
    return cardColor.computeLuminance() > 0.5
        ? Colors.black // Light card color means dark text for contrast
        : Colors.white; // Dark card color means light text for contrast
  }

  @override
  Widget build(BuildContext context) {
    // Get the appropriate color for the card
    Color cardColor = _getCardColor(tip, context);
    // Get the heading text color based on card background brightness
    Color headingColor = _getHeadingTextColor(context, cardColor);

    return SizedBox(
      height: 120.0, // Fixed height for the card
      width: double.infinity, // Full width
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: cardColor, // Set the card color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daily Health Tip", // The heading for the tip
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: headingColor, // Set the heading color dynamically
                ),
              ),
              const SizedBox(height: 8), // Space between the heading and the content
              Flexible(
                child: Text(
                  tip, // Display the tip text as a single line
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333), // Set text color to #333333
                  ),
                  overflow: TextOverflow.ellipsis, // To handle text overflow
                  maxLines: 1, // Ensure it's a single line
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
