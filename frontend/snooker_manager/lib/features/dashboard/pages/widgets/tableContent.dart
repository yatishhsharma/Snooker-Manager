import 'package:flutter/material.dart';

class TableContent extends StatefulWidget {
  final int index;

  const TableContent({super.key, required this.index});

  @override
  State<TableContent> createState() => _TableContentState();
}

class _TableContentState extends State<TableContent> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Table ${widget.index + 1}",
                style: const TextStyle(color: Colors.white),
              ),
              const Text("00:10:00", style: TextStyle(color: Colors.white)),
              const Text("₹ 40", style: TextStyle(color: Colors.yellow)),
            ],
          )
        : IconButton(
            icon: const Icon(Icons.play_circle, size: 50, color: Colors.green),
            onPressed: () {
              setState(() {
                isActive = true;
              });
            },
          );
  }
}
