import 'package:flutter/material.dart';
import 'package:template/features/screens/calendar_screen.dart';
import 'package:template/features/screens/schedule_screen.dart';
import '../../widgets/garbage_list_card..dart';
import '../../utils/garbage_schedule.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final garbageList = GarbageSchedule.getGarbageForDate(today);

    return Scaffold(
      appBar: AppBar(
        title: const Text("오늘의 쓰레기 배출"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "${today.year}년 ${today.month}월 ${today.day}일 (${_weekdayToKorean(today.weekday)})",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GarbageListCard(garbageList: garbageList),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CalendarScreen()),
                );
              },
              icon: const Icon(Icons.calendar_month),
              label: const Text("전체 달력 보기"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ScheduleScreen()),
                );
              },
              icon: const Icon(Icons.schedule),
              label: const Text("배출 정리표 보기"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _weekdayToKorean(int weekday) {
    switch (weekday) {
      case 1:
        return "월";
      case 2:
        return "화";
      case 3:
        return "수";
      case 4:
        return "목";
      case 5:
        return "금";
      case 6:
        return "토";
      case 7:
        return "일";
      default:
        return "";
    }
  }
}
