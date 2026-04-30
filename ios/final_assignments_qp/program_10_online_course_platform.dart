// Program 10: Online Course Platform login with Courses and Profile radio buttons.

import 'package:flutter/material.dart';

void main() => runApp(const OnlineCourseApp());

class OnlineCourseApp extends StatelessWidget {
  const OnlineCourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseLoginPage(),
    );
  }
}

class CourseLoginPage extends StatefulWidget {
  const CourseLoginPage({super.key});

  @override
  State<CourseLoginPage> createState() => _CourseLoginPageState();
}

class _CourseLoginPageState extends State<CourseLoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (usernameController.text == 'alex' && passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CourseDashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Online Course Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            const Text('Username: alex  Password: 1234'),
          ],
        ),
      ),
    );
  }
}

class CourseDashboardPage extends StatefulWidget {
  const CourseDashboardPage({super.key});

  @override
  State<CourseDashboardPage> createState() => _CourseDashboardPageState();
}

class _CourseDashboardPageState extends State<CourseDashboardPage> {
  String selectedOption = 'Courses';

  void openSelectedPage(String value) {
    setState(() {
      selectedOption = value;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => value == 'Courses'
            ? const CourseOptionPage(
                title: 'Browse Available Courses',
                icon: Icons.menu_book,
                color: Colors.teal,
              )
            : const CourseOptionPage(
                title: 'User Profile Details',
                icon: Icons.person,
                color: Colors.pink,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome, Alex!')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
            title: const Text('Courses'),
            value: 'Courses',
            groupValue: selectedOption,
            onChanged: (value) => openSelectedPage(value.toString()),
          ),
          RadioListTile(
            title: const Text('Profile'),
            value: 'Profile',
            groupValue: selectedOption,
            onChanged: (value) => openSelectedPage(value.toString()),
          ),
        ],
      ),
    );
  }
}

class CourseOptionPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const CourseOptionPage({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: Text(title)),
      body: Center(
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
