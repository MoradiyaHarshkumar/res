import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/color_provider.dart';

class ColorTab extends StatelessWidget {
  const ColorTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ColorProvider>();

    return Container(
      color: colorProvider.bgColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Change Background Color",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<ColorProvider>().changeColor(Colors.red.shade100);
              },
              child: const Text("Red"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ColorProvider>().changeColor(Colors.green.shade100);
              },
              child: const Text("Green"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ColorProvider>().changeColor(Colors.blue.shade100);
              },
              child: const Text("Blue"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ColorProvider>().changeColor(Colors.yellow.shade100);
              },
              child: const Text("Yellow"),
            ),
          ],
        ),
      ),
    );
  }
}
