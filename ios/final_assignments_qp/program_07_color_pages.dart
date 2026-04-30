// Program 7: Home page with Red, Green and Blue buttons navigating to colour pages.

import 'package:flutter/material.dart';

void main() => runApp(const ColorPagesApp());

class ColorPagesApp extends StatelessWidget {
  const ColorPagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorHomePage(),
    );
  }
}

class ColorHomePage extends StatelessWidget {
  const ColorHomePage({super.key});

  void openPage(BuildContext context, String title, Color color) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ColorPage(title: title, color: color),
      ),
    );
  }

  Widget colorButton(
    BuildContext context,
    String text,
    Color color,
    Color foreground,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: foreground,
      ),
      onPressed: () => openPage(context, 'Welcome to $text Page', color),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            colorButton(context, 'Red', Colors.red, Colors.white),
            colorButton(context, 'Green', Colors.green, Colors.white),
            colorButton(context, 'Blue', Colors.blue, Colors.white),
          ],
        ),
      ),
    );
  }
}

class ColorPage extends StatelessWidget {
  final String title;
  final Color color;

  const ColorPage({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
