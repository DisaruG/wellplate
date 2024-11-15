import 'package:flutter/material.dart';

class DailyTipCard extends StatelessWidget {
  final String tip;

  const DailyTipCard({
    super.key,
    required this.tip, // The tip content passed as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0, // Fixed height for the card
      width: double.infinity, // Full width
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Daily Health Tip", // The heading for the tip
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8), // Space between the heading and the content
              Flexible(
                child: Text(
                  tip, // Display the tip text as a single line
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
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
