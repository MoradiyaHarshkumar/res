// Program 10: Demonstrate DataTable Widget for presentation of data items.

import 'package:flutter/material.dart';

void main() {
  runApp(const DataTableApp());
}

class DataTableApp extends StatelessWidget {
  const DataTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataTableScreen(),
    );
  }
}

class DataTableScreen extends StatelessWidget {
  const DataTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DataTable Widget')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Roll No')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Course')),
            DataColumn(label: Text('Marks')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Amit')),
              DataCell(Text('Flutter')),
              DataCell(Text('88')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Riya')),
              DataCell(Text('Python')),
              DataCell(Text('92')),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('Karan')),
              DataCell(Text('PHP')),
              DataCell(Text('80')),
            ]),
          ],
        ),
      ),
    );
  }
}
