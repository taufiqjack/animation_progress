import 'package:animation_load_progress/animation_load_progress.dart';
import 'package:flutter/material.dart';

String arabic = 'ar';
String indonesia = 'id';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.blue.shade800),
            colorScheme: ColorScheme.light(primary: Colors.blue.shade800)),
        home: const HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isAsync = false; //add variable

  void signIn() {
    isAsync = true;
    setState(() {});
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        isAsync = false;
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    signIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLoadProgress(
        inAsyncCall: isAsync,
        colorProgress: Colors.red, //choose your colors
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Loading ...',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Loading Example'),
          ),
        ));
  }
}
