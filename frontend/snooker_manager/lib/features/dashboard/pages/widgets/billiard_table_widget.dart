import 'package:flutter/material.dart';

class PoolTableWidget extends StatelessWidget {
  final Widget? child;
  const PoolTableWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double itemWidth = (screenWidth / 2) - 20;
    return SizedBox(
      width: itemWidth,
      height: itemWidth * 100,
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: PoolTablePainter())),
          if (child != null) Center(child: child!),
        ],
      ),
    );
  }
}

class PoolTablePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, size) {
    final cushionWidth = size.width * 0.03;
    final pocketRadius = size.width * 0.02;

    final framePaint = Paint()..color = const Color(0xFF4E342E);

    final frameRect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(size.width * 0.010),
    );

    canvas.drawRRect(frameRect, framePaint);

    final tableRect = Rect.fromLTWH(
      cushionWidth,
      cushionWidth,
      size.width - cushionWidth * 2,
      size.height - cushionWidth * 2,
    );

    final tablePaint = Paint()
      ..shader = LinearGradient(
        colors: [
          const Color(0xFF2E7D32),
          const Color.fromARGB(255, 11, 157, 18),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(tableRect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(tableRect, Radius.circular(size.width * 0.010)),
      tablePaint,
    );

    final pocketPaint = Paint()..color = Colors.black;

    final pockets = [
      Offset(cushionWidth, cushionWidth),
      Offset(size.width / 2, cushionWidth),
      Offset(size.width - cushionWidth, cushionWidth),
      Offset(cushionWidth, size.height - cushionWidth),
      Offset(size.width / 2, size.height - cushionWidth),
      Offset(size.width - cushionWidth, size.height - cushionWidth),
    ];

    for (final p in pockets) {
      canvas.drawCircle(p, pocketRadius, pocketPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
