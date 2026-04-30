// Program 5: Custom button widget with text, color, size, rounded corners and press effect.

import 'package:flutter/material.dart';

void main() => runApp(const CustomButtonApp());

class CustomButtonApp extends StatelessWidget {
  const CustomButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomButtonScreen(),
    );
  }
}

class CustomButtonScreen extends StatefulWidget {
  const CustomButtonScreen({super.key});

  @override
  State<CustomButtonScreen> createState() => _CustomButtonScreenState();
}

class _CustomButtonScreenState extends State<CustomButtonScreen> {
  Color buttonColor = Colors.blue;

  void changeColor() {
    setState(() {
      buttonColor = buttonColor == Colors.blue ? Colors.green : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Button')),
      body: Center(
        child: CustomButton(
          text: 'Submit',
          color: buttonColor,
          width: 180,
          height: 55,
          onTap: changeColor,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
