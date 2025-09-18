import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'custom01_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD2DDB0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD2DDB0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              (route) => false,
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text(
              '로그인하기',
              style: TextStyle(color: Color(0xFF1A1A1A)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '회원가입하기',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '계정을 만들고 헤이카운을 이용해보세요!',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 30),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "이름",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1A1A1A),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "이름을 입력하세요",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Color(0xFF1A1A1A)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Color(0xFF1A1A1A), width: 1.5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        "이메일",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1A1A1A),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "이메일을 입력하세요",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Color(0xFF1A1A1A)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Color(0xFF1A1A1A), width: 1.5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        "아이디",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1A1A1A),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "아이디를 입력하세요",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Color(0xFF1A1A1A)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Color(0xFF1A1A1A), width: 1.5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        "비밀번호",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1A1A1A),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "비밀번호를 입력하세요",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Color(0xFF1A1A1A)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Color(0xFF1A1A1A), width: 1.5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                        ),
                      ),

                      const SizedBox(height: 48),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -24,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 250,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Custom01Screen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF7E7A7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(0.3),
                        ),
                        child: const Text(
                          '회원가입',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 56),
            const Row(
              children: [
                Expanded(
                    child: Divider(thickness: 1, color: Color(0xFF1A1A1A))),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '다음으로 회원가입하기',
                    style: TextStyle(color: Color(0xFF1A1A1A)),
                  ),
                ),
                Expanded(
                    child: Divider(thickness: 1, color: Color(0xFF1A1A1A))),
              ],
            ),
            const SizedBox(height: 24),

            Center(
              child: SignInButton(
                Buttons.Google,
                text: "Google 계정으로 로그인",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
