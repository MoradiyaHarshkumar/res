// Program 11: Demonstrate Table Widget for presentation of employee data items.

import 'package:flutter/material.dart';

void main() {
  runApp(const EmployeeTableApp());
}

class EmployeeTableApp extends StatelessWidget {
  const EmployeeTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmployeeTableScreen(),
    );
  }
}

class EmployeeTableScreen extends StatelessWidget {
  const EmployeeTableScreen({super.key});

  Widget cell(String text, {bool header = false}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: header ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Table')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Table(
          border: TableBorder.all(),
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.green.shade100),
              children: [
                cell('ID', header: true),
                cell('Name', header: true),
                cell('Department', header: true),
              ],
            ),
            TableRow(children: [
              cell('101'),
              cell('Neha'),
              cell('IT'),
            ]),
            TableRow(children: [
              cell('102'),
              cell('Rahul'),
              cell('HR'),
            ]),
            TableRow(children: [
              cell('103'),
              cell('Priya'),
              cell('Finance'),
            ]),
          ],
        ),
      ),
    );
  }
}
