// Program 2: TabBar with Home, Messages and Profile using different background colours.

import 'package:flutter/material.dart';

void main() => runApp(const ThreeTabApp());

class ThreeTabApp extends StatelessWidget {
  const ThreeTabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThreeTabScreen(),
    );
  }
}

class ThreeTabScreen extends StatelessWidget {
  const ThreeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Three Tabs'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.message), text: 'Messages'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ColoredTab(
              color: Colors.orange,
              icon: Icons.home,
              title: 'Home Tab',
            ),
            MessageTab(),
            ProfileTab(),
          ],
        ),
      ),
    );
  }
}

class ColoredTab extends StatelessWidget {
  final MaterialColor color;
  final IconData icon;
  final String title;

  const ColoredTab({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.shade100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80),
            Text(title, style: const TextStyle(fontSize: 26)),
          ],
        ),
      ),
    );
  }
}

class MessageTab extends StatelessWidget {
  const MessageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade100,
      child: ListView(
        children: const [
          ListTile(title: Text('Message 1: Welcome')),
          ListTile(title: Text('Message 2: Assignment submitted')),
          ListTile(title: Text('Message 3: Practical exam today')),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: const Center(
        child: Text(
          'Name: Alex\nCourse: Flutter\nSemester: 2',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
