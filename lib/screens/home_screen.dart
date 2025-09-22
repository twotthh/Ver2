import 'package:flutter/material.dart';
import 'calendar_screen.dart';
import 'checklist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Map<String, dynamic>> _checklist = [
    {"title": "컴활 인강듣기", "isChecked": false},
    {"title": "필라테스 19시", "isChecked": true},
    {"title": "토익 모고 1회분 풀어보기", "isChecked": false},
  ];

  Future<void> _goToChecklist(BuildContext context) async {
    final newItem = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChecklistScreen()),
    );

    if (newItem != null && newItem is Map<String, dynamic>) {
      setState(() {
        _checklist.add({"title": newItem["title"], "isChecked": false});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFAFAFA),
        selectedItemColor: const Color(0xFF89778D),
        unselectedItemColor: const Color(0xFFDCBEE2),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CalendarScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "H",
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(
                          text: "e",
                          style: TextStyle(
                            color: Color(0xFFD2DDB0),
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(
                          text: "yC",
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(
                          text: "o",
                          style: TextStyle(
                            color: Color(0xFFF7E7A7), 
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(
                          text: "u",
                          style: TextStyle(
                            color: Color(0xFFDCBEE2), 
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(
                          text: "n",
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.notifications, color: Color(0xFF1A1A1A), size: 28),
                ],
              ),

              const SizedBox(height: 23),

              const Text(
                "반가워요!\n오늘도 상담을 시작해볼까요?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),

              const SizedBox(height: 23),

              SizedBox(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCard(
                      title: "그래픽 디자이너가\n되기 위한\n자격증 종류",
                      date: "2025년 9월 19일",
                    ),
                    const SizedBox(width: 30),
                    _buildCard(
                      title: "게임 개발자에게\n유리하게 적용가능한\n자기 PR 방법",
                      date: "2025년 10월 9일",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF7E7A7)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < _checklist.length; i++) ...[
                      _buildTodoItem(i),
                      if (i != _checklist.length - 1) const Divider(),
                    ],
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () => _goToChecklist(context),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF7E7A7),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add, color: Color(0xFFFAFAFA), size: 28),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required String date}) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD2DDB0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                date,
                style: const TextStyle(fontSize: 15, color: Color(0xFF1A1A1A)),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFFAFAFA),
                child: const Icon(Icons.arrow_forward_ios,
                    size: 20, color: Color(0xFF1A1A1A)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoItem(int index) {
    final item = _checklist[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          item["isChecked"] = !(item["isChecked"] as bool);
        });
      },
      child: Row(
        children: [
          Icon(
            item["isChecked"] ? Icons.check_circle : Icons.radio_button_unchecked,
            color: const Color(0xFFF7E7A7),
          ),
          const SizedBox(width: 20),
          Text(
            item["title"],
            style: TextStyle(
              fontSize: 18,
              fontWeight: item["isChecked"] ? FontWeight.w600 : FontWeight.normal,
              color: const Color(0xFF1A1A1A),
              decoration: item["isChecked"]
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
