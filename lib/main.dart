import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<bool> selectedItems = List.generate(5, (index) => false);

  void _showSelectedItemsCount() {
    int selectedCount = selectedItems.where((element) => element).length;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Selected Items'),
        content: Text('Number of selected items: $selectedCount'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Screen'),
      ),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (context, index) => ListTile(
          tileColor: selectedItems[index] ? Colors.blue : null, // Change color if selected
          title: Text('Item ${index + 1}'),
          onTap: () {
            setState(() {
              selectedItems[index] = !selectedItems[index]; // Toggle selection on tap
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSelectedItemsCount,
        child: const Icon(Icons.check),
      ),
    );
  }
}
