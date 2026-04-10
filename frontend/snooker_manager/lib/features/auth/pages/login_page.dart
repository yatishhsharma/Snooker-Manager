import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:snooker_manager/core/animations/fade_then_slide.dart';
import 'package:snooker_manager/core/animations/swipe_from_right.dart';
import 'package:snooker_manager/features/auth/pages/widgets/custom_field.dart';
import '../repositories/auth_remote_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 16, 240),
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SlideFromRight(
                  child: Text(
                    "Sign In Your Account",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.1),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 550),
                  decoration: BoxDecoration(),
                  child: SlideFromRight(
                    child: Column(
                      children: [
                        FadeThenSlide(
                          duration: Duration(milliseconds: 800),
                          child: CustomField(
                            hintText: "Email",
                            controller: emailController,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        FadeThenSlide(
                          duration: Duration(milliseconds: 1000),
                          child: CustomField(
                            hintText: "Password",
                            obscureText: true,
                            controller: passwordController,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        FadeThenSlide(
                          duration: Duration(milliseconds: 1200),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(
                                colors: [Colors.green, Colors.lightGreen],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                final authRepository = AuthRemoteRepository();
                                final res = await authRepository.signIn(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                final val = switch (res) {
                                  Left(value: final l) => l,
                                  Right(value: final r) => r.name,
                                };
                                print(val);
                              },
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                  child: Divider(color: Colors.grey, thickness: 1, height: 100),
                ),
                const Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: height * 0.05),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue as Guest",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
