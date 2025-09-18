import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/intro_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ko", "KR"),
        Locale("en", "US"),
      ],
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3), () => "Intro Completed."),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: _splashLoadingWidget(snapshot)
          );
        },
      ),
    );
  }
}

Widget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if(snapshot.hasError) {
      return const Text("Error!!");
    } else if(snapshot.hasData) {
      return WelcomeScreen();
    } else {
      return const IntroScreen();
    }
  }
