// Program 5: Create a scrollable dynamic list of 20 checkboxes using ListView.builder
// and create a dynamic grid of three columns displaying 10 icons.

import 'package:flutter/material.dart';

void main() {
  runApp(const DynamicListGridApp());
}

class DynamicListGridApp extends StatelessWidget {
  const DynamicListGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DynamicListGridScreen(),
    );
  }
}

class DynamicListGridScreen extends StatefulWidget {
  const DynamicListGridScreen({super.key});

  @override
  State<DynamicListGridScreen> createState() => _DynamicListGridScreenState();
}

class _DynamicListGridScreenState extends State<DynamicListGridScreen> {
  final List<bool> checkedItems = List.generate(20, (index) => false);

  final List<IconData> icons = [
    Icons.home,
    Icons.person,
    Icons.phone,
    Icons.email,
    Icons.camera_alt,
    Icons.favorite,
    Icons.star,
    Icons.school,
    Icons.sports_cricket,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ListView and GridView'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Checkbox List'),
              Tab(text: 'Icon Grid'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: checkedItems.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text('Checkbox ${index + 1}'),
                  value: checkedItems[index],
                  onChanged: (value) {
                    setState(() {
                      checkedItems[index] = value!;
                    });
                  },
                );
              },
            ),
            GridView.count(
              crossAxisCount: 3,
              children: icons
                  .map(
                    (icon) => Card(
                      child: Icon(icon, size: 50, color: Colors.blue),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
