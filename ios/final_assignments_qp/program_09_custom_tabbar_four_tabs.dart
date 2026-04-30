// Program 9: Custom TabBar with Home, Search, Notifications and Profile tabs.

import 'package:flutter/material.dart';

void main() => runApp(const CustomFourTabApp());

class CustomFourTabApp extends StatelessWidget {
  const CustomFourTabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const CustomFourTabScreen(),
    );
  }
}

class CustomFourTabScreen extends StatelessWidget {
  const CustomFourTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Custom TabBar'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.notifications), text: 'Notifications'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CenterTab(title: 'Home', icon: Icons.home),
            CenterTab(title: 'Search', icon: Icons.search),
            CenterTab(title: 'Notifications', icon: Icons.notifications),
            CenterTab(title: 'Profile', icon: Icons.person),
          ],
        ),
      ),
    );
  }
}

class CenterTab extends StatelessWidget {
  final String title;
  final IconData icon;

  const CenterTab({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 90, color: Colors.indigo),
          Text(title, style: const TextStyle(fontSize: 28)),
        ],
      ),
    );
  }
}
