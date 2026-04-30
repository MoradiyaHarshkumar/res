// Program 4: Four radio buttons to choose preferred mode of transportation.

import 'package:flutter/material.dart';

void main() => runApp(const TransportRadioApp());

class TransportRadioApp extends StatelessWidget {
  const TransportRadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TransportRadioScreen(),
    );
  }
}

class TransportRadioScreen extends StatefulWidget {
  const TransportRadioScreen({super.key});

  @override
  State<TransportRadioScreen> createState() => _TransportRadioScreenState();
}

class _TransportRadioScreenState extends State<TransportRadioScreen> {
  String selectedMode = 'Car';
  final modes = ['Car', 'Bike', 'Bus', 'Train'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transportation Mode')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Choose Mode:', style: TextStyle(fontSize: 24)),
            ...modes.map(
              (mode) => RadioListTile(
                title: Text(mode),
                value: mode,
                groupValue: selectedMode,
                onChanged: (value) {
                  setState(() {
                    selectedMode = value.toString();
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Selected Mode is: $selectedMode',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
