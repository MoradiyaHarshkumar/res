// Program 7: Create an app with four screens using named routes.
// Each screen has three buttons to redirect to the other three screens.

import 'package:flutter/material.dart';

void main() {
  runApp(const NamedRouteApp());
}

class NamedRouteApp extends StatelessWidget {
  const NamedRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/one',
      routes: {
        '/one': (context) => const RouteScreen(
              title: 'Screen One',
              currentRoute: '/one',
            ),
        '/two': (context) => const RouteScreen(
              title: 'Screen Two',
              currentRoute: '/two',
            ),
        '/three': (context) => const RouteScreen(
              title: 'Screen Three',
              currentRoute: '/three',
            ),
        '/four': (context) => const RouteScreen(
              title: 'Screen Four',
              currentRoute: '/four',
            ),
      },
    );
  }
}

class RouteScreen extends StatelessWidget {
  final String title;
  final String currentRoute;

  const RouteScreen({
    super.key,
    required this.title,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/one': 'Screen One',
      '/two': 'Screen Two',
      '/three': 'Screen Three',
      '/four': 'Screen Four',
    };
    final otherRoutes =
        routes.entries.where((entry) => entry.key != currentRoute).toList();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 20),
            ...otherRoutes.map(
              (entry) => ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, entry.key);
                },
                child: Text('Go to ${entry.value}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
