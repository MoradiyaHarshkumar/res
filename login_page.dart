import 'package:flutter/material.dart';

import '../routes/custom_page_route.dart';
import 'welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String selectedRole = "student";

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (selectedRole == "student" &&
        username == "student" &&
        password == "222") {
      Navigator.pushReplacement(
        context,
        CustomPageRoute(const WelcomePage(role: "Student")),
      );
    } else if (selectedRole == "faculty" &&
        username == "faculty" &&
        password == "111") {
      Navigator.pushReplacement(
        context,
        CustomPageRoute(const WelcomePage(role: "Faculty")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid login details")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: "appHero",
              child: Icon(Icons.account_circle, size: 90),
            ),
            const SizedBox(height: 20),
            RadioListTile(
              title: const Text("Student Login"),
              value: "student",
              groupValue: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Faculty Login"),
              value: "faculty",
              groupValue: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value.toString();
                });
              },
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),
            const Text("Student: student / 222"),
            const Text("Faculty: faculty / 111"),
          ],
        ),
      ),
    );
  }
}
