// Program 6: Student Login System with Dashboard tabs for Undergraduate and Postgraduate.

import 'package:flutter/material.dart';

void main() => runApp(const StudentLoginApp());

class StudentLoginApp extends StatelessWidget {
  const StudentLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentLoginPage(),
    );
  }
}

class StudentLoginPage extends StatefulWidget {
  const StudentLoginPage({super.key});

  @override
  State<StudentLoginPage> createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (idController.text == 'kk' && passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StudentDashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid student credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'Student ID'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            const Text('Student ID: kk  Password: 1234'),
          ],
        ),
      ),
    );
  }
}

class StudentDashboardPage extends StatelessWidget {
  const StudentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hello, KK!'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Undergraduate'),
              Tab(text: 'Postgraduate'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StudentLevelPage(
              title: 'Welcome Undergraduate',
              icon: Icons.menu_book,
              color: Colors.green,
            ),
            StudentLevelPage(
              title: 'Welcome Postgraduate',
              icon: Icons.school,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class StudentLevelPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const StudentLevelPage({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 90, color: Colors.white),
            Text(title, style: const TextStyle(fontSize: 26, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
