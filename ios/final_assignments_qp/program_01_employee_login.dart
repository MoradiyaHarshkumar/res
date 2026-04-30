// Program 1: Company Employee Login System with Manager, Staff and Logout.

import 'package:flutter/material.dart';

void main() => runApp(const EmployeeLoginApp());

class EmployeeLoginApp extends StatelessWidget {
  const EmployeeLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmployeeLoginPage(),
    );
  }
}

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  final codeController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (codeController.text == 'emp101' && passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EmployeeWelcomePage(name: 'Rahul'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid employee code or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: codeController,
              decoration: const InputDecoration(labelText: 'Employee Code'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            const SizedBox(height: 10),
            const Text('Code: emp101  Password: 1234'),
          ],
        ),
      ),
    );
  }
}

class EmployeeWelcomePage extends StatelessWidget {
  final String name;

  const EmployeeWelcomePage({super.key, required this.name});

  void logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const EmployeeLoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello $name'),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RolePage(
                    title: 'Welcome Manager',
                    icon: Icons.business_center,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: const Text('Manager'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RolePage(
                    title: 'Welcome Staff',
                    icon: Icons.settings,
                    color: Colors.cyan,
                  ),
                ),
              ),
              child: const Text('Staff'),
            ),
          ],
        ),
      ),
    );
  }
}

class RolePage extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const RolePage({
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
            Icon(icon, size: 90),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 28)),
          ],
        ),
      ),
    );
  }
}
