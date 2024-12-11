import 'package:flutter/material.dart';

class ShoppingListContent extends StatefulWidget {
  const ShoppingListContent({super.key});

  @override
  State<ShoppingListContent> createState() => _ShoppingListContentState();
}

class _ShoppingListContentState extends State<ShoppingListContent> {
  final List<Map<String, dynamic>> _shoppingList = [];
  final List<String> _notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FF), // Soft blue background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notes Section at the top of the screen
            if (_notes.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _notes.map((note) {
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
                        title: Text(
                          note,
                          style: const TextStyle(fontSize: 18),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeNote(_notes.indexOf(note)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            // Shopping List Items Section below Notes
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
                          color: item['bought']
                              ? Colors.grey
                              : Colors.black,
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
                child: Text('Your shopping list is empty!'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNoteDialog,
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

  // Remove note from the notes list
  void _removeNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  // Show dialog to add a new note
  void _showAddNoteDialog() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Note'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter your note'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    _notes.add(controller.text);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
