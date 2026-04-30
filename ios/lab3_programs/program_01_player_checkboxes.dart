// Program 1: Display five checkboxes and show selected player names immediately.

import 'package:flutter/material.dart';

void main() {
  runApp(const PlayerCheckboxApp());
}

class PlayerCheckboxApp extends StatelessWidget {
  const PlayerCheckboxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayerCheckboxScreen(),
    );
  }
}

class PlayerCheckboxScreen extends StatefulWidget {
  const PlayerCheckboxScreen({super.key});

  @override
  State<PlayerCheckboxScreen> createState() => _PlayerCheckboxScreenState();
}

class _PlayerCheckboxScreenState extends State<PlayerCheckboxScreen> {
  final Map<String, bool> players = {
    'Virat Kohli': false,
    'Rohit Sharma': false,
    'MS Dhoni': false,
    'Jasprit Bumrah': false,
    'Hardik Pandya': false,
  };

  String get selectedPlayers {
    final selected = players.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selected.isEmpty) {
      return 'No player selected';
    }
    return 'Selected Players: ${selected.join(', ')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Player Checkboxes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...players.keys.map(
              (name) => CheckboxListTile(
                title: Text(name),
                value: players[name],
                onChanged: (value) {
                  setState(() {
                    players[name] = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              selectedPlayers,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
