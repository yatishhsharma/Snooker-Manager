import 'dart:async';
import 'package:flutter/material.dart';

class BilliardTableWidget extends StatefulWidget {
  final Map table;
  final VoidCallback onStart;
  final VoidCallback onEnd;

  const BilliardTableWidget({
    super.key,
    required this.table,
    required this.onStart,
    required this.onEnd,
  });

  @override
  State<BilliardTableWidget> createState() => _BilliardTableWidgetState();
}

class _BilliardTableWidgetState extends State<BilliardTableWidget> {
  Duration elapsed = Duration.zero;
  Timer? timer;

  final double ratePerHour = 100; // later from settings

  @override
  void initState() {
    super.initState();

    if (widget.table['status'] == 'occupied') {
      startTimer();
    }
  }

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        elapsed += const Duration(seconds: 1);
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  double get liveAmount {
    return (elapsed.inSeconds / 3600) * ratePerHour;
  }

  String formatTime(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(d.inHours)}:${two(d.inMinutes % 60)}:${two(d.inSeconds % 60)}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isOccupied = widget.table['status'] == 'occupied';

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isOccupied ? Colors.red : Colors.green,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Table Name
          Text(
            "Table ${widget.table['table_number']}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          if (isOccupied) ...[
            /// Customer Name (TEMP)
            Text(
              "Player: ${widget.table['customer_name'] ?? "Unknown"}",
              style: const TextStyle(color: Colors.white70),
            ),

            /// Timer
            Text(
              formatTime(elapsed),
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),

            /// Live Amount
            Text(
              "₹ ${liveAmount.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.greenAccent, fontSize: 18),
            ),

            /// Pause Button
            IconButton(
              icon: const Icon(Icons.pause, color: Colors.red, size: 30),
              onPressed: () {
                stopTimer();
                widget.onEnd();
              },
            ),
          ] else ...[
            /// Play Button
            IconButton(
              icon: const Icon(Icons.play_arrow, color: Colors.green, size: 40),
              onPressed: widget.onStart,
            ),
          ],
        ],
      ),
    );
  }
}
