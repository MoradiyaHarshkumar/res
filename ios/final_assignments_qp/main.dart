// Combined Main File: Final Assignments QP
// This file gives a menu to open all 10 assignment programs.

import 'package:flutter/material.dart';

import 'program_01_employee_login.dart' as p1;
import 'program_02_tabbar_home_messages_profile.dart' as p2;
import 'program_03_ecommerce_login.dart' as p3;
import 'program_04_transport_radio.dart' as p4;
import 'program_05_custom_button.dart' as p5;
import 'program_06_student_login_tabs.dart' as p6;
import 'program_07_color_pages.dart' as p7;
import 'program_08_event_management.dart' as p8;
import 'program_09_custom_tabbar_four_tabs.dart' as p9;
import 'program_10_online_course_platform.dart' as p10;

void main() {
  runApp(const FinalAssignmentsApp());
}

class FinalAssignmentsApp extends StatelessWidget {
  const FinalAssignmentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AssignmentMenuPage(),
    );
  }
}

class AssignmentMenuPage extends StatelessWidget {
  const AssignmentMenuPage({super.key});

  void openProgram(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final programs = [
      AssignmentItem(
        title: 'Program 1',
        subtitle: 'Employee Login: Manager, Staff and Logout',
        page: const p1.EmployeeLoginPage(),
      ),
      AssignmentItem(
        title: 'Program 2',
        subtitle: 'TabBar: Home, Messages and Profile',
        page: const p2.ThreeTabScreen(),
      ),
      AssignmentItem(
        title: 'Program 3',
        subtitle: 'E-commerce Login: Buyer and Seller',
        page: const p3.EcommerceLoginPage(),
      ),
      AssignmentItem(
        title: 'Program 4',
        subtitle: 'Transportation radio buttons',
        page: const p4.TransportRadioScreen(),
      ),
      AssignmentItem(
        title: 'Program 5',
        subtitle: 'Custom animated button',
        page: const p5.CustomButtonScreen(),
      ),
      AssignmentItem(
        title: 'Program 6',
        subtitle: 'Student Login with Undergraduate and Postgraduate tabs',
        page: const p6.StudentLoginPage(),
      ),
      AssignmentItem(
        title: 'Program 7',
        subtitle: 'Red, Green and Blue navigation pages',
        page: const p7.ColorHomePage(),
      ),
      AssignmentItem(
        title: 'Program 8',
        subtitle: 'Event Management forms and table output',
        page: const p8.EventLoginPage(),
      ),
      AssignmentItem(
        title: 'Program 9',
        subtitle: 'Custom TabBar with four tabs',
        page: const p9.CustomFourTabScreen(),
      ),
      AssignmentItem(
        title: 'Program 10',
        subtitle: 'Online Course Platform with radio navigation',
        page: const p10.CourseLoginPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Final Assignments QP')),
      body: ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(program.title),
              subtitle: Text(program.subtitle),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => openProgram(context, program.page),
            ),
          );
        },
      ),
    );
  }
}

class AssignmentItem {
  final String title;
  final String subtitle;
  final Widget page;

  const AssignmentItem({
    required this.title,
    required this.subtitle,
    required this.page,
  });
}
