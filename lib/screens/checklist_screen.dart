import 'package:flutter/material.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({Key? key}) : super(key: key);

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  String title = "";
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String description = "";

  final List<String> categories = [
    "자격증", "마케팅", "미팅", "개발",
    "iOS 앱", "안드로이드 앱", "그래픽 디자인", "영상 편집",
    "데이터 분석", "기획", "번역", "기타",
  ];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A), size: 28),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("체크리스트", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("제목", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            TextField(
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                border: UnderlineInputBorder(),
                hintText: "토익 스터디",
              ),
              style: const TextStyle(fontSize: 16, color: Color(0xFF1A1A1A)),
              onChanged: (value) => setState(() => title = value),
            ),
            const SizedBox(height: 20),
            const Text("날짜", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    decoration: const InputDecoration(border: UnderlineInputBorder()),
                    hint: const Text("년"),
                    value: selectedDate?.year,
                    items: List.generate(10, (i) {
                      int year = DateTime.now().year + i;
                      return DropdownMenuItem(value: year, child: Text("$year"));
                    }),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          selectedDate = DateTime(val, selectedDate?.month ?? 1, selectedDate?.day ?? 1);
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    decoration: const InputDecoration(border: UnderlineInputBorder()),
                    hint: const Text("월"),
                    value: selectedDate?.month,
                    items: List.generate(12, (i) {
                      return DropdownMenuItem(value: i + 1, child: Text("${i + 1}"));
                    }),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          selectedDate = DateTime(selectedDate?.year ?? DateTime.now().year, val, selectedDate?.day ?? 1);
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    decoration: const InputDecoration(border: UnderlineInputBorder()),
                    hint: const Text("일"),
                    value: selectedDate?.day,
                    items: List.generate(31, (i) {
                      return DropdownMenuItem(value: i + 1, child: Text("${i + 1}"));
                    }),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          selectedDate = DateTime(
                              selectedDate?.year ?? DateTime.now().year,
                              selectedDate?.month ?? 1,
                              val);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("시작 시간", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      GestureDetector(
                        onTap: () async {
                          final picked = await showTimePicker(
                            context: context,
                            initialTime: startTime ?? const TimeOfDay(hour: 13, minute: 0),
                          );
                          if (picked != null) setState(() => startTime = picked);
                        },
                        child: Text(
                          startTime != null ? startTime!.format(context) : "선택",
                          style: const TextStyle(fontSize: 16, color: Color(0xFF1A1A1A)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("종료 시간", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      GestureDetector(
                        onTap: () async {
                          final picked = await showTimePicker(
                            context: context,
                            initialTime: endTime ?? const TimeOfDay(hour: 15, minute: 0),
                          );
                          if (picked != null) setState(() => endTime = picked);
                        },
                        child: Text(
                          endTime != null ? endTime!.format(context) : "선택",
                          style: const TextStyle(fontSize: 16, color: Color(0xFF1A1A1A)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text("내용", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            TextField(
              controller: TextEditingController(text: description),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                border: UnderlineInputBorder(),
                hintText: "2025년 9월 9일 시험 예정",
                hintStyle: TextStyle(color: Color(0xFF1A1A1A), fontWeight: FontWeight.w400),
              ),
              style: const TextStyle(fontSize: 16, color: Color(0xFF1A1A1A)),
              onChanged: (val) => setState(() => description = val),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("카테고리", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: Color(0xFFD2DDB0), size: 28),
                  onPressed: () async {
                    String newCategory = "";
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("카테고리 추가"),
                          content: TextField(
                            autofocus: true,
                            decoration: const InputDecoration(hintText: "새 카테고리 입력"),
                            onChanged: (val) {
                              newCategory = val;
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("취소"),
                            ),
                            TextButton(
                              onPressed: () {
                                if (newCategory.trim().isNotEmpty) {
                                  setState(() {
                                    categories.add(newCategory.trim());
                                    selectedCategory = newCategory.trim();
                                  });
                                }
                                Navigator.of(context).pop();
                              },
                              child: const Text("추가"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: categories.map((cat) {
                final isSelected = selectedCategory == cat;
                return GestureDetector(
                  onTap: () => setState(() => selectedCategory = cat),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFFF7E7A7) : Color(0xFFD2DDB0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      cat,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Color(0xFF1A1A1A) : Color(0xFFFAFAFA),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD2DDB0),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  if (description.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("내용을 입력해주세요.")),
                    );
                    return;
                  }
                  final checklistData = {
                    "title": title,
                    "date": selectedDate,
                    "startTime": startTime,
                    "endTime": endTime,
                    "description": description,
                    "category": selectedCategory,
                  };
                  Navigator.pop(context, checklistData);
                },
                child: const Text(
                  "저장하기",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFFAFAFA)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
