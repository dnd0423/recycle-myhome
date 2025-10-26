import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("전체 달력"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          "여기에 달력 UI 구현 예정",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
