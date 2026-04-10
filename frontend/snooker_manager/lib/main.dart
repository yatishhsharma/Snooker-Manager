import 'package:flutter/material.dart';
import 'package:snooker_manager/core/theme/theme.dart';
import 'package:snooker_manager/features/auth/pages/get_started.dart';
// import 'package:snooker_manager/features/auth/pages/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snooker Manager',
      darkTheme: AppTheme.darkThemeMode,
      theme: AppTheme.lightThemeMode,
      themeMode: ThemeMode.system,
      home: StartPage(),
    );
  }
}
