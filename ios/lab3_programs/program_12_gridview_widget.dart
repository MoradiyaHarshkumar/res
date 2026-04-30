// Program 12: Demonstrate GridView Widget for presentation of data items.

import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewApp());
}

class GridViewApp extends StatelessWidget {
  const GridViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridViewScreen(),
    );
  }
}

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(12, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('GridView Widget')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue.shade100,
            child: Center(
              child: Text(
                items[index],
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
