import 'package:flutter/material.dart';

class ShoppingListContent extends StatefulWidget {
  const ShoppingListContent({super.key});

  @override
  State<ShoppingListContent> createState() => _ShoppingListContentState();
}

class _ShoppingListContentState extends State<ShoppingListContent> {
  final List<Map<String, dynamic>> _shoppingList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FF), // Soft blue background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Shopping List Items Section
            Expanded(
              child: _shoppingList.isNotEmpty
                  ? ListView.builder(
                itemCount: _shoppingList.length,
                itemBuilder: (context, index) {
                  final item = _shoppingList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        value: item['bought'],
                        onChanged: (bool? value) {
                          setState(() {
                            item['bought'] = value ?? false;
                          });
                        },
                        activeColor: const Color(0xFF1565C0),
                      ),
                      title: Text(
                        item['name'],
                        style: TextStyle(
                          fontSize: 18,
                          decoration: item['bought']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: item['bought'] ? Colors.grey : Colors.black,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeItem(index),
                      ),
                    ),
                  );
                },
              )
                  : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart, size: 100, color: Color(0xFF1565C0)),
                    SizedBox(height: 16),
                    Text(
                      'Your shopping list is empty!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1565C0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showOptions,
        backgroundColor: const Color(0xFF1565C0),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Remove item from the shopping list
  void _removeItem(int index) {
    setState(() {
      _shoppingList.removeAt(index);
    });
  }

  // Show options for different tools
  void _showOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.note, color: Color(0xFF1565C0)),
              title: const Text('Notes'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Notes screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Color(0xFF1565C0)),
              title: const Text('Grocery List'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Grocery List screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: Color(0xFF1565C0)),
              title: const Text('Meal Planner'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Meal Planner screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.close, color: Colors.red),
              title: const Text('Cancel'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
