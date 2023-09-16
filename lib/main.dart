import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeActivity());
  }
}

class HomeActivity extends StatelessWidget{
  HomeActivity({super.key});
  final List<Map<String, dynamic>> shoppingItems = [
    {"name": "Apple", "icon": Icons.shopping_cart},
    {"name": "Banana", "icon": Icons.shopping_cart},
    {"name": "Bread", "icon": Icons.shopping_cart},
    {"name": "Milk", "icon": Icons.shopping_cart},
    {"name": "Egg", "icon": Icons.shopping_cart},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shopping List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [Icon(Icons.shopping_cart)],
      ),
      body: ListView.builder(
        itemCount: shoppingItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(shoppingItems[index]["icon"]),
            title: Text(shoppingItems[index]["name"]),
            onTap: () {
              // Handle item tap
            },
          );
        },
      ),
    );
  }
}