import 'package:flutter/material.dart';
import 'package:thimar/views/login_view.dart';
import 'package:thimar/views/splah_view.dart';

void main() {
  runApp(
    Directionality(textDirection: TextDirection.rtl, child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginView.routeName: (context) => LoginView(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff4C8613),
           primary: const Color(0xff4C8613)),
           brightness: Brightness.light,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Tajawal'),
        ),
        primaryTextTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Tajawal'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
