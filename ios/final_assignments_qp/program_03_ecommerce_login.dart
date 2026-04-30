// Program 3: E-commerce Login System with Buyer, Seller and Logout.

import 'package:flutter/material.dart';

void main() => runApp(const EcommerceLoginApp());

class EcommerceLoginApp extends StatelessWidget {
  const EcommerceLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EcommerceLoginPage(),
    );
  }
}

class EcommerceLoginPage extends StatefulWidget {
  const EcommerceLoginPage({super.key});

  @override
  State<EcommerceLoginPage> createState() => _EcommerceLoginPageState();
}

class _EcommerceLoginPageState extends State<EcommerceLoginPage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (userController.text == 'alex' && passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EcommerceWelcomePage(username: 'Alex'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid user id or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('E-commerce Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(labelText: 'User ID'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            const Text('User ID: alex  Password: 1234'),
          ],
        ),
      ),
    );
  }
}

class EcommerceWelcomePage extends StatelessWidget {
  final String username;

  const EcommerceWelcomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello $username'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const EcommerceLoginPage()),
              );
            },
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
                  builder: (context) => const ShopRolePage(
                    title: 'Welcome Buyer',
                    icon: Icons.shopping_cart,
                    color: Colors.purple,
                  ),
                ),
              ),
              child: const Text('Buyer'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopRolePage(
                    title: 'Welcome Seller',
                    icon: Icons.store,
                    color: Colors.brown,
                  ),
                ),
              ),
              child: const Text('Seller'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopRolePage extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const ShopRolePage({
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
            Text(title, style: const TextStyle(fontSize: 28, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
