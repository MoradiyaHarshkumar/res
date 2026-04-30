// Program 3: Create two tabs with different background colours.
// First tab displays three images using Row, second tab displays three images using Column.

import 'package:flutter/material.dart';

void main() {
  runApp(const ImageTabApp());
}

class ImageTabApp extends StatelessWidget {
  const ImageTabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageTabScreen(),
    );
  }
}

class ImageTabScreen extends StatelessWidget {
  const ImageTabScreen({super.key});

  static const images = [
    'https://picsum.photos/seed/one/200',
    'https://picsum.photos/seed/two/200',
    'https://picsum.photos/seed/three/200',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabs With Images'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Row Images'),
              Tab(text: 'Column Images'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.orange.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: images
                    .map((url) => Image.network(url, width: 100, height: 100))
                    .toList(),
              ),
            ),
            Container(
              color: Colors.green.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: images
                    .map((url) => Image.network(url, width: 140, height: 140))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
