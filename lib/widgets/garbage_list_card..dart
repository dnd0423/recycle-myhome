import 'package:flutter/material.dart';

class GarbageListCard extends StatelessWidget {
  // 이제 이 위젯은 쓰레기 종류의 리스트를 받습니다.
  final List<String> garbageList;

  const GarbageListCard({
    super.key,
    required this.garbageList, // 생성자가 List<String>을 받도록 수정됨
  });

  @override
  Widget build(BuildContext context) {
    // 1. 배출할 쓰레기가 없을 경우
    if (garbageList.isEmpty) {
      return const Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              "오늘은 배출할 쓰레기가 없습니다!😊",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),
        ),
      );
    }

    // 2. 배출할 쓰레기가 있을 경우: Column에 여러 항목을 표시
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // 리스트의 각 항목(쓰레기 종류)을 위젯으로 변환하여 children에 넣습니다.
      children: garbageList
          .map((type) => _buildGarbageItem(type, context))
          .toList(),
    );
  }

  // 개별 쓰레기 항목을 표시하는 위젯 (이 부분이 기존 GarbageCard의 역할 일부를 수행)
  Widget _buildGarbageItem(String type, BuildContext context) {
    return Card(
      color: Colors.green.shade50.withOpacity(0.8), // 배경색
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 8), // 항목 사이에 간격 추가
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(
            _getIconForType(type),
            color: Colors.white,
          ), // 아이콘을 동적으로 설정
        ),
        title: Text(
          type,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('오늘 18시까지 배출해 주세요.'),
        trailing: const Icon(Icons.check_circle_outline, color: Colors.green),
      ),
    );
  }

  // 쓰레기 종류에 따라 다른 아이콘을 반환하는 함수 (예시)
  IconData _getIconForType(String type) {
    if (type.contains("일반")) return Icons.delete;
    if (type.contains("플라스틱") || type.contains("패트병")) return Icons.recycling;
    if (type.contains("금속") || type.contains("캔"))
      return Icons.widgets_outlined;
    if (type.contains("종이")) return Icons.description;
    if (type.contains("병")) return Icons.recycling;
    return Icons.delete_outline;
  }
}
