// ignore: file_names
import 'package:flutter/material.dart';
import 'package:snooker_manager/core/animations/swipe_animation.dart';
import 'package:snooker_manager/core/animations/swipe_from_right.dart';
import 'package:snooker_manager/features/auth/pages/signup.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void _handleNavigation() {
    try {
      if (!mounted) return;

      Navigator.push(context, SwipePageRoute(page: const SigninPage()));
    } catch (e, stack) {
      debugPrint("Navigation Error: $e");
      debugPrint("StackTrace: $stack");

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Something went wrong. Please try again."),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.30), // replaces 240 safely

                Transform.scale(
                  scale: 3.0,
                  child: Image.asset(
                    'assets/images/Main.png',
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      debugPrint("Image Error: $error");

                      return const Icon(
                        Icons.broken_image,
                        size: 100,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.25), // replaces 40 safely

                const SlideFromRight(
                  child: Text(
                    "Welcome to Hi-End Snooker Manager",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),

                  // replaces 90 safely
                ),

                SizedBox(height: height * 0.10), // replaces 90 safely
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 125, 48),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => _handleNavigation(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_sharp),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(20),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "All Copyrights Reserved © 2026",
              style: TextStyle(fontSize: 8, color: Colors.grey),
            ),
            SizedBox(width: 20),
            Text(
              "Vriddhi Technologies",
              style: TextStyle(fontSize: 8, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
