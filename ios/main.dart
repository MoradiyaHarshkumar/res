import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Practical',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

// --- LOGIN PAGE ---
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  String _selectedRole = 'User'; // Default role

  void _login() {
    if (_userController.text.isNotEmpty && _passController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              WelcomePage(username: _userController.text, role: _selectedRole),
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter credentials")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Hero Animation Tag
              const Hero(
                tag: 'app_logo',
                child: Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _userController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Select Role:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RadioListTile(
                title: const Text("User"),
                value: "User",
                groupValue: _selectedRole,
                onChanged: (val) => setState(() => _selectedRole = val!),
              ),
              RadioListTile(
                title: const Text("Admin"),
                value: "Admin",
                groupValue: _selectedRole,
                onChanged: (val) => setState(() => _selectedRole = val!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _login,
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- WELCOME PAGE ---
class WelcomePage extends StatefulWidget {
  final String username;
  final String role;

  const WelcomePage({super.key, required this.username, required this.role});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Color _bgColor = Colors.white;
  final List<String> _allPlayers = [
    "Lionel Messi",
    "Cristiano Ronaldo",
    "Neymar Jr",
    "Kylian Mbappé",
  ];
  final List<String> _selectedPlayers = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: _bgColor,
        appBar: AppBar(
          title: Text("Welcome, ${widget.username}"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => Navigator.pop(context),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.palette), text: "Theme"),
              Tab(icon: Icon(Icons.sports_soccer), text: "Players"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // TAB 1: COLOR CHANGER
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Hero(
                    tag: 'app_logo',
                    child: Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Logged in as: ${widget.role}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  const Text("Change Background Color:"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            setState(() => _bgColor = Colors.red.shade100),
                        child: const Text("Red"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () =>
                            setState(() => _bgColor = Colors.green.shade100),
                        child: const Text("Green"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () =>
                            setState(() => _bgColor = Colors.white),
                        child: const Text("Reset"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // TAB 2: PLAYER SELECTION
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Select Players:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _allPlayers.length,
                      itemBuilder: (context, index) {
                        final player = _allPlayers[index];
                        return CheckboxListTile(
                          title: Text(player),
                          value: _selectedPlayers.contains(player),
                          onChanged: (bool? checked) {
                            setState(() {
                              if (checked == true) {
                                _selectedPlayers.add(player);
                              } else {
                                _selectedPlayers.remove(player);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  const Text(
                    "Selected Squad:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _selectedPlayers.isEmpty
                        ? "None"
                        : _selectedPlayers.join(", "),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
