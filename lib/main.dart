import 'package:flutter/material.dart';
import 'features/screens/home_screen.dart';
import 'features/screens/calendar_screen.dart';
import 'features/screens/schedule_screen.dart';

void main() {
  runApp(const GarbageApp());
}

class GarbageApp extends StatelessWidget {
  const GarbageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garbage Schedule',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CalendarScreen(),
    ScheduleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '달력',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: '정리표'),
        ],
      ),
    );
  }
}
