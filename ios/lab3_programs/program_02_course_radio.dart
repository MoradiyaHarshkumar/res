// Program 2: Create radio buttons to choose a favourite course.

import 'package:flutter/material.dart';

void main() {
  runApp(const CourseRadioApp());
}

class CourseRadioApp extends StatelessWidget {
  const CourseRadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseRadioScreen(),
    );
  }
}

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
      appBar: AppBar(title: const Text('Course Radio Button')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Course:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 20),
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
