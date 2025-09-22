import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();
  int? selectedIndex;
  List<String> records = [
    "해외 애니메이션 엠디 회사에서 인턴 경험",
    "기록 2",
    "기록 3",
    "기록 4",
    "기록 5",
    "기록 6",
  ];

  @override
  Widget build(BuildContext context) {
    String yearMonth = DateFormat("yyyy년 M월").format(selectedDate);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        yearMonth,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.calendar_today, color: Color(0xFFDCBEE2)),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            locale: const Locale("ko", "KR"),
                          ).then((picked) {
                            if (picked != null) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCBEE2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(7, (index) {
                    DateTime weekDay = selectedDate
                        .subtract(Duration(days: selectedDate.weekday - 1))
                        .add(Duration(days: index));
                    bool isSelected = weekDay.day == selectedDate.day &&
                        weekDay.month == selectedDate.month &&
                        weekDay.year == selectedDate.year;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = weekDay;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFFAFAFA)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              ["일", "월", "화", "수", "목", "금", "토"][index],
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? const Color(0xFF1A1A1A)
                                    : Colors.black54,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              weekDay.day.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected
                                    ? const Color(0xFF1A1A1A)
                                    : Colors.black54,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "지난 기록들",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  itemCount: records.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Card(
                        elevation: 2,
                        color: isSelected ? const Color(0xFFDCBEE2) : Color(0xFFFAFAFA),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                          title: Text(
                            records[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: isSelected ? Colors.white : Color(0xFF1A1A1A),
                            ),
                          ),
                          subtitle: Text(
                            "자세한 대화 보기",
                            style: TextStyle(
                              color: isSelected ? Colors.white70 : Colors.black54,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.more_vert, color: isSelected ? Colors.white : Color(0xFF1A1A1A)),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('기록 삭제'),
                                  content: const Text('해당 기록을 지우겠습니까?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('취소'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          records.removeAt(index);
                                          if (selectedIndex == index) selectedIndex = null;
                                          else if (selectedIndex != null && selectedIndex! > index) selectedIndex = selectedIndex! - 1;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text('삭제'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
