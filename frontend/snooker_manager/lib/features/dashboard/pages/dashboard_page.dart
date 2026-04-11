import 'package:flutter/material.dart';
import 'package:snooker_manager/features/dashboard/pages/widgets/billiard_table_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(width: 100, height: 200, child: PoolTableWidget()),
        ),
      ),
    );
  }
}
