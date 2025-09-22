import 'package:flutter/material.dart';
import 'custom02_screen.dart';

class Custom01Screen extends StatefulWidget {
  const Custom01Screen({Key? key}) : super(key: key);

  @override
  State<Custom01Screen> createState() => _Custom01ScreenState();
}


class _Custom01ScreenState extends State<Custom01Screen> {
  String? selectedYear;
  String? selectedMonth;
  String? selectedDay;
  String gender = "남자";

  final TextEditingController majorController = TextEditingController();
  final List<TextEditingController> certControllers = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null && details.primaryVelocity! < -200) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const Custom02Screen(),
                transitionsBuilder: (_, animation, __, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
                  return SlideTransition(position: animation.drive(tween), child: child);
                },
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              LinearProgressIndicator(
                value: 0.5,
                color: Color(0xFFDCBEE2),
                backgroundColor: Colors.grey.shade200,
                minHeight: 6,
                borderRadius: BorderRadius.circular(12),
              ),
              const SizedBox(height: 55),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 60, color: Color(0xFFFAFAFA)),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color(0xFF1A1A1A),
                      child: const Icon(Icons.camera_alt,
                          size: 18, color: Color(0xFFFAFAFA)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              // 생년월일
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("생년월일",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      value: selectedYear,
                      hint: const Text("년"),
                      items: List.generate(
                        100,
                        (index) => (1980 + index).toString(),
                      ).map((year) {
                        return DropdownMenuItem(value: year, child: Text(year));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      value: selectedMonth,
                      hint: const Text("월"),
                      items: List.generate(12, (index) => (index + 1).toString())
                          .map((month) {
                        return DropdownMenuItem(value: month, child: Text(month));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      value: selectedDay,
                      hint: const Text("일"),
                      items: List.generate(31, (index) => (index + 1).toString())
                          .map((day) {
                        return DropdownMenuItem(value: day, child: Text(day));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDay = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("성별",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 10),
              ToggleButtons(
                isSelected: [gender == "남자", gender == "여자"],
                onPressed: (index) {
                  setState(() {
                    gender = index == 0 ? "남자" : "여자";
                  });
                },
                borderRadius: BorderRadius.circular(12),
                selectedColor: Color(0xFFFAFAFA),
                fillColor: Color(0xFFDCBEE2),
                color: Color(0xFF1A1A1A),
                constraints:
                    const BoxConstraints(minWidth: 178, minHeight: 40),
                children: const [
                  Text("남자"),
                  Text("여자"),
                ],
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("전공(선택사항)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: majorController,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  hintText: "직접입력",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("자격증(선택사항)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  for (int i = 0; i < certControllers.length; i++) ...[
                    TextField(
                      controller: certControllers[i],
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        hintText: "직접입력",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ]
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    certControllers.add(TextEditingController());
                  });
                },
                icon: const Icon(Icons.add_circle,
                    size: 40, color: Color(0xFFDCBEE2)),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Custom02Screen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDCBEE2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "다음으로",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFAFAFA)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
