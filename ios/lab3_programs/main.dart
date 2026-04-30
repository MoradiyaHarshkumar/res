// Lab Assignment 3 Combined Main File
// This single Flutter file contains all 12 practical programs.

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const Lab3App());
}

class Lab3App extends StatelessWidget {
  const Lab3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab Assignment 3',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeMenuScreen(),
        '/program1': (context) => const PlayerCheckboxScreen(),
        '/program2': (context) => const CourseRadioScreen(),
        '/program3': (context) => const ImageTabScreen(),
        '/program4': (context) => const ImageSliderScreen(),
        '/program5': (context) => const DynamicListGridScreen(),
        '/program6': (context) => const DrawerHomeScreen(),
        '/program7': (context) =>
            const FourRouteScreen(title: 'Screen One', currentRoute: '/p7one'),
        '/program8': (context) => const SplashScreen(),
        '/program9': (context) => const TableWidgetScreen(),
        '/program10': (context) => const DataTableScreen(),
        '/program11': (context) => const EmployeeTableScreen(),
        '/program12': (context) => const GridViewScreen(),
        '/p7one': (context) =>
            const FourRouteScreen(title: 'Screen One', currentRoute: '/p7one'),
        '/p7two': (context) =>
            const FourRouteScreen(title: 'Screen Two', currentRoute: '/p7two'),
        '/p7three': (context) => const FourRouteScreen(
              title: 'Screen Three',
              currentRoute: '/p7three',
            ),
        '/p7four': (context) => const FourRouteScreen(
              title: 'Screen Four',
              currentRoute: '/p7four',
            ),
      },
    );
  }
}

class HomeMenuScreen extends StatelessWidget {
  const HomeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final programs = [
      ['Program 1', 'Five player checkboxes', '/program1'],
      ['Program 2', 'Course radio buttons', '/program2'],
      ['Program 3', 'Tabs with Row and Column images', '/program3'],
      ['Program 4', 'Image slider', '/program4'],
      ['Program 5', 'ListView checkboxes and GridView icons', '/program5'],
      ['Program 6', 'Drawer with Login, Greet, Close', '/program6'],
      ['Program 7', 'Four screens with named routes', '/program7'],
      ['Program 8', 'Splash, Login and Welcome page', '/program8'],
      ['Program 9', 'Table widget', '/program9'],
      ['Program 10', 'DataTable widget', '/program10'],
      ['Program 11', 'Employee table widget', '/program11'],
      ['Program 12', 'GridView widget', '/program12'],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lab Assignment 3')),
      body: ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final item = programs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(item[0]),
              subtitle: Text(item[1]),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Navigator.pushNamed(context, item[2]),
            ),
          );
        },
      ),
    );
  }
}

// Program 1: Display five checkboxes and show selected player names immediately.
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
    return selected.isEmpty
        ? 'No player selected'
        : 'Selected Players: ${selected.join(', ')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 1: Player Checkboxes')),
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
            Text(selectedPlayers, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// Program 2: Create radio buttons to choose a favourite course.
class CourseRadioScreen extends StatefulWidget {
  const CourseRadioScreen({super.key});

  @override
  State<CourseRadioScreen> createState() => _CourseRadioScreenState();
}

class _CourseRadioScreenState extends State<CourseRadioScreen> {
  String selectedCourse = 'Flutter';
  final List<String> courses = ['FullStack', 'PHP', 'Flutter', 'Python'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 2: Course Radio')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Course:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ...courses.map(
              (course) => RadioListTile(
                title: Text(course),
                value: course,
                groupValue: selectedCourse,
                onChanged: (value) {
                  setState(() {
                    selectedCourse = value.toString();
                  });
                },
              ),
            ),
            Text(
              'Your Selected Course is: $selectedCourse',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

// Program 3: Two tabs with different background colours.
// First tab shows images in Row, second tab shows images in Column.
class ImageTabScreen extends StatelessWidget {
  const ImageTabScreen({super.key});

  static const images = [
    'https://picsum.photos/seed/one/200',
    'https://picsum.photos/seed/two/200',
    'https://picsum.photos/seed/three/200',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Program 3: Tabs With Images'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Row Images'),
              Tab(text: 'Column Images'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.orange.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: images
                    .map((url) => Image.network(url, width: 100, height: 100))
                    .toList(),
              ),
            ),
            Container(
              color: Colors.green.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: images
                    .map((url) => Image.network(url, width: 140, height: 140))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Program 4: Demonstrate an image slider using PageView.
class ImageSliderScreen extends StatefulWidget {
  const ImageSliderScreen({super.key});

  @override
  State<ImageSliderScreen> createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<String> images = [
    'https://picsum.photos/seed/slider1/600/350',
    'https://picsum.photos/seed/slider2/600/350',
    'https://picsum.photos/seed/slider3/600/350',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 4: Image Slider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: controller,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.network(images[index], fit: BoxFit.cover),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => Container(
                margin: const EdgeInsets.all(4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Program 5: Dynamic list of 20 checkboxes using ListView.builder
// and dynamic grid of three columns displaying 10 icons.
class DynamicListGridScreen extends StatefulWidget {
  const DynamicListGridScreen({super.key});

  @override
  State<DynamicListGridScreen> createState() => _DynamicListGridScreenState();
}

class _DynamicListGridScreenState extends State<DynamicListGridScreen> {
  final List<bool> checkedItems = List.generate(20, (index) => false);
  final List<IconData> icons = [
    Icons.home,
    Icons.person,
    Icons.phone,
    Icons.email,
    Icons.camera_alt,
    Icons.favorite,
    Icons.star,
    Icons.school,
    Icons.sports_cricket,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Program 5: List and Grid'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Checkbox List'),
              Tab(text: 'Icon Grid'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: checkedItems.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text('Checkbox ${index + 1}'),
                  value: checkedItems[index],
                  onChanged: (value) {
                    setState(() {
                      checkedItems[index] = value!;
                    });
                  },
                );
              },
            ),
            GridView.count(
              crossAxisCount: 3,
              children: icons
                  .map(
                    (icon) => Card(
                      child: Icon(icon, size: 50, color: Colors.blue),
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

// Program 6: Drawer with Login, Greet and Close options.
class DrawerHomeScreen extends StatelessWidget {
  const DrawerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 6: Drawer')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DrawerLoginScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.waving_hand),
              title: const Text('Greet'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DrawerGreetScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Close'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Open drawer from top left')),
    );
  }
}

class DrawerLoginScreen extends StatelessWidget {
  const DrawerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(labelText: 'Username')),
            TextField(decoration: InputDecoration(labelText: 'Password')),
          ],
        ),
      ),
    );
  }
}

class DrawerGreetScreen extends StatelessWidget {
  const DrawerGreetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Greet')),
      body: const Center(
        child: Text('Have a good day', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Program 7: Four screens using named routes.
// Each screen has three buttons to redirect to the other three screens.
class FourRouteScreen extends StatelessWidget {
  final String title;
  final String currentRoute;

  const FourRouteScreen({
    super.key,
    required this.title,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/p7one': 'Screen One',
      '/p7two': 'Screen Two',
      '/p7three': 'Screen Three',
      '/p7four': 'Screen Four',
    };
    final otherRoutes =
        routes.entries.where((entry) => entry.key != currentRoute).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Program 7: $title')),
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

// Program 8: Splash Screen, Login Page and Welcome Page.
// Valid credentials open Welcome Page; invalid credentials show a dialog box.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LabLoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
}

class LabLoginPage extends StatefulWidget {
  const LabLoginPage({super.key});

  @override
  State<LabLoginPage> createState() => _LabLoginPageState();
}

class _LabLoginPageState extends State<LabLoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (usernameController.text == 'admin' &&
        passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LabWelcomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Login'),
          content: const Text('Please enter correct username and password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 8: Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            const SizedBox(height: 10),
            const Text('Username: admin  Password: 1234'),
          ],
        ),
      ),
    );
  }
}

class LabWelcomePage extends StatelessWidget {
  const LabWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome Page')),
      body: const Center(
        child: Text('Welcome User', style: TextStyle(fontSize: 28)),
      ),
    );
  }
}

// Program 9: Demonstrate Table Widget for presentation of data items.
class TableWidgetScreen extends StatelessWidget {
  const TableWidgetScreen({super.key});

  TableRow buildRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue.shade100 : Colors.white,
      ),
      children: cells
          .map(
            (cell) => Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                cell,
                style: TextStyle(
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 9: Table Widget')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            buildRow(['Roll No', 'Name', 'Marks'], isHeader: true),
            buildRow(['1', 'Amit', '85']),
            buildRow(['2', 'Riya', '90']),
            buildRow(['3', 'Karan', '78']),
          ],
        ),
      ),
    );
  }
}

// Program 10: Demonstrate DataTable Widget for presentation of data items.
class DataTableScreen extends StatelessWidget {
  const DataTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 10: DataTable')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Roll No')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Course')),
            DataColumn(label: Text('Marks')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Amit')),
              DataCell(Text('Flutter')),
              DataCell(Text('88')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Riya')),
              DataCell(Text('Python')),
              DataCell(Text('92')),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('Karan')),
              DataCell(Text('PHP')),
              DataCell(Text('80')),
            ]),
          ],
        ),
      ),
    );
  }
}

// Program 11: Demonstrate Table Widget for presentation of employee data.
class EmployeeTableScreen extends StatelessWidget {
  const EmployeeTableScreen({super.key});

  Widget cell(String text, {bool header = false}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: header ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program 11: Employee Table')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Table(
          border: TableBorder.all(),
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.green.shade100),
              children: [
                cell('ID', header: true),
                cell('Name', header: true),
                cell('Department', header: true),
              ],
            ),
            TableRow(children: [cell('101'), cell('Neha'), cell('IT')]),
            TableRow(children: [cell('102'), cell('Rahul'), cell('HR')]),
            TableRow(children: [cell('103'), cell('Priya'), cell('Finance')]),
          ],
        ),
      ),
    );
  }
}

// Program 12: Demonstrate GridView Widget for presentation of data items.
class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(12, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('Program 12: GridView')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue.shade100,
            child: Center(
              child: Text(items[index], style: const TextStyle(fontSize: 18)),
            ),
          );
        },
      ),
    );
  }
}
