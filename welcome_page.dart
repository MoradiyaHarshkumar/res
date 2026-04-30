import 'package:flutter/material.dart';

import 'color_tab.dart';
import 'login_page.dart';
import 'player_tab.dart';

class WelcomePage extends StatelessWidget {
  final String role;

  const WelcomePage({super.key, required this.role});

  void logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Hero(
                tag: "appHero",
                child: Icon(Icons.account_circle, size: 35),
              ),
              const SizedBox(width: 10),
              Text("Welcome $role"),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                logout(context);
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.color_lens), text: "Colors"),
              Tab(icon: Icon(Icons.sports_cricket), text: "Players"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ColorTab(),
            PlayerTab(),
          ],
        ),
      ),
    );
  }
}
