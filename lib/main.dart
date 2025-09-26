import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/home/categories/cubit/cubit.dart';
import 'package:thimar/views/home/products/cubit.dart';
import 'package:thimar/views/home/slider/cubit.dart';
import 'package:thimar/views/login/view.dart';
import 'package:thimar/views/splash/splah_view.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
        BlocProvider(create: (context) => SliderCubit()),
        BlocProvider(create: (context) => ProductsCubit()),
      ],
      child: MaterialApp(
        routes: {LoginView.routeName: (context) => LoginView()},
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            surface: const Color(0xFFFFFFFF),
            seedColor: const Color(0xff4C8613),
            primary: const Color(0xff4C8613),
          ),
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
      ),
    );
  }
}
