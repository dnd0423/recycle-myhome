import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> schedule = [
      {"요일": "월 / 목", "종류": "일반 쓰레기 / 유해 쓰레기"},
      {"요일": "화(1,3주)", "종류": "병 / 캔"},
      {"요일": "화(2,4주)", "종류": "패트병 / 섬유류"},
      {"요일": "수", "종류": "플라스틱 포장용기"},
      {"요일": "수(2,4주)", "종류": "금속 / 종이(박스)"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("배출 정리표"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          final item = schedule[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                item["요일"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item["종류"]!),
            ),
          );
        },
      ),
    );
  }
}
