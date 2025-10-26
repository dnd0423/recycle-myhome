class GarbageSchedule {
  /// 해당 날짜에 배출되는 쓰레기 종류 리스트 반환
  /// 예: ["플라스틱 포장용기", "금속 / 종이(박스)"]
  static List<String> getGarbageForDate(DateTime date) {
    final weekday = date.weekday; // 월=1 ... 일=7
    final day = date.day;
    final weekOfMonth = ((day - 1) ~/ 7) + 1;

    List<String> result = [];

    if (weekday == DateTime.monday || weekday == DateTime.thursday) {
      result.add("일반 쓰레기 / 유해 쓰레기");
    }
    if (weekday == DateTime.wednesday) {
      result.add("플라스틱 포장용기");
      if (weekOfMonth == 2 || weekOfMonth == 4) {
        result.add("금속 / 종이(박스)");
      }
    }
    if (weekday == DateTime.tuesday) {
      if (weekOfMonth == 1 || weekOfMonth == 3) {
        result.add("병 / 캔");
      }
      if (weekOfMonth == 2 || weekOfMonth == 4) {
        result.add("패트병 / 섬유류");
      }
    }

    return result;
  }

  /// 요일 이름(한국어) 반환
  static String weekdayName(int weekday) {
    const names = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"];
    if (weekday < 1 || weekday > 7) return "";
    return names[weekday - 1];
  }
}
