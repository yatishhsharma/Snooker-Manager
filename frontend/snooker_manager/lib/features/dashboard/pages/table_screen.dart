import 'package:flutter/material.dart';
import '../pages/widgets/table_gridview.dart';

class TablesScreen extends StatelessWidget {
  const TablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Snooker Tables Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.scale(
                scale: 3,
                child: Image(
                  image: AssetImage("assets/images/SnookerBackground.jpeg"),
                ),
              ),
            ),

            TablesGrid(tableCount: 3),
          ],
        ),
      ),
    );
  }
}
