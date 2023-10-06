import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizeSelector(),
    );
  }
}

class SizeSelector extends StatefulWidget {
  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

MySnackBar(message, context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
    ),
  );
}

class _SizeSelectorState extends State<SizeSelector> {
  String selectedSize = '';

  ElevatedButton _buildSizeButton(BuildContext context, String size) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedSize = size;
        });
        MySnackBar(size, context);
      },
      style: ElevatedButton.styleFrom(
        primary: size == selectedSize ? Colors.green : Colors.blue,
      ),
      child: Text(size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10.0, // Adjust the spacing between buttons
          runSpacing: 10.0, // Adjust the spacing between rows
          children: [
            _buildSizeButton(context, 'S'),
            _buildSizeButton(context, 'M'),
            _buildSizeButton(context, 'L'),
            _buildSizeButton(context, 'XL'),
            _buildSizeButton(context, 'XXL'),
            _buildSizeButton(context, 'XXXL'),
          ],
        ),
      ),
    );
  }
}
