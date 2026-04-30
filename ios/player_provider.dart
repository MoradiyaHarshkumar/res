import 'package:flutter/material.dart';

class PlayerProvider extends ChangeNotifier {
  bool virat = false;
  bool rohit = false;
  bool dhoni = false;
  bool bumrah = false;

  void changeVirat(bool value) {
    virat = value;
    notifyListeners();
  }

  void changeRohit(bool value) {
    rohit = value;
    notifyListeners();
  }

  void changeDhoni(bool value) {
    dhoni = value;
    notifyListeners();
  }

  void changeBumrah(bool value) {
    bumrah = value;
    notifyListeners();
  }

  String get selectedPlayers {
    List<String> players = [];

    if (virat) players.add("Virat Kohli");
    if (rohit) players.add("Rohit Sharma");
    if (dhoni) players.add("MS Dhoni");
    if (bumrah) players.add("Jasprit Bumrah");

    if (players.isEmpty) {
      return "No player selected";
    }

    return "Selected Players: ${players.join(", ")}";
  }
}
