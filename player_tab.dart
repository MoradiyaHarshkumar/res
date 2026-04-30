import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/player_provider.dart';

class PlayerTab extends StatelessWidget {
  const PlayerTab({super.key});

  @override
  Widget build(BuildContext context) {
    final playerProvider = context.watch<PlayerProvider>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CheckboxListTile(
            title: const Text("Virat Kohli"),
            value: playerProvider.virat,
            onChanged: (value) {
              context.read<PlayerProvider>().changeVirat(value!);
            },
          ),
          CheckboxListTile(
            title: const Text("Rohit Sharma"),
            value: playerProvider.rohit,
            onChanged: (value) {
              context.read<PlayerProvider>().changeRohit(value!);
            },
          ),
          CheckboxListTile(
            title: const Text("MS Dhoni"),
            value: playerProvider.dhoni,
            onChanged: (value) {
              context.read<PlayerProvider>().changeDhoni(value!);
            },
          ),
          CheckboxListTile(
            title: const Text("Jasprit Bumrah"),
            value: playerProvider.bumrah,
            onChanged: (value) {
              context.read<PlayerProvider>().changeBumrah(value!);
            },
          ),
          const SizedBox(height: 20),
          Text(
            playerProvider.selectedPlayers,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
