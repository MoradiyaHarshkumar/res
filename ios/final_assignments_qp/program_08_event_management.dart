// Program 8: Event Management System with login, forms and table display.

import 'package:flutter/material.dart';

void main() => runApp(const EventManagementApp());

class EventManagementApp extends StatelessWidget {
  const EventManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventLoginPage(),
    );
  }
}

class EventLoginPage extends StatefulWidget {
  const EventLoginPage({super.key});

  @override
  State<EventLoginPage> createState() => _EventLoginPageState();
}

class _EventLoginPageState extends State<EventLoginPage> {
  final eventIdController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (eventIdController.text == 'event101' &&
        passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const EventDashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid event id or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: eventIdController,
              decoration: const InputDecoration(labelText: 'Event ID'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            const Text('Event ID: event101  Password: 1234'),
          ],
        ),
      ),
    );
  }
}

class EventDashboardPage extends StatelessWidget {
  const EventDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome, Organizer!')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EventFormPage(type: 'Concerts'),
                ),
              ),
              child: const Text('Concerts'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EventFormPage(type: 'Conferences'),
                ),
              ),
              child: const Text('Conferences'),
            ),
          ],
        ),
      ),
    );
  }
}

class EventFormPage extends StatefulWidget {
  final String type;

  const EventFormPage({super.key, required this.type});

  @override
  State<EventFormPage> createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final placeController = TextEditingController();

  void submit() {
    final details = [
      ['Name/Title', nameController.text],
      ['Date', dateController.text],
      [widget.type == 'Concerts' ? 'Venue' : 'Location', placeController.text],
    ];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventResultPage(type: widget.type, details: details),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.type == 'Concerts' ? 'Event Name' : 'Conference Title';

    return Scaffold(
      appBar: AppBar(title: Text('${widget.type} Form')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: label),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: placeController,
              decoration: InputDecoration(
                labelText: widget.type == 'Concerts' ? 'Venue' : 'Location',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: submit, child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}

class EventResultPage extends StatelessWidget {
  final String type;
  final List<List<String>> details;

  const EventResultPage({
    super.key,
    required this.type,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final isConcert = type == 'Concerts';

    return Scaffold(
      backgroundColor: isConcert ? Colors.red : Colors.blue,
      appBar: AppBar(title: Text(isConcert ? 'Concert Events' : 'Upcoming Conferences')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isConcert ? Icons.music_note : Icons.mic,
              size: 90,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Table(
              border: TableBorder.all(color: Colors.white),
              children: details
                  .map(
                    (row) => TableRow(
                      children: row
                          .map(
                            (cell) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                cell,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
