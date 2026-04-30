// Program 9: Demonstrate Table Widget for presentation of data items.

import 'package:flutter/material.dart';

void main() {
  runApp(const TableWidgetApp());
}

class TableWidgetApp extends StatelessWidget {
  const TableWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TableWidgetScreen(),
    );
  }
}

class TableWidgetScreen extends StatelessWidget {
  const TableWidgetScreen({super.key});

  TableRow buildRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue.shade100 : Colors.white,
      ),
      children: cells
          .map(
            (cell) => Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                cell,
                style: TextStyle(
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table Widget')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            buildRow(['Roll No', 'Name', 'Marks'], isHeader: true),
            buildRow(['1', 'Amit', '85']),
            buildRow(['2', 'Riya', '90']),
            buildRow(['3', 'Karan', '78']),
          ],
        ),
      ),
    );
  }
}
