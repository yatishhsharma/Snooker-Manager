import 'dart:async';
import 'package:flutter/material.dart';

class AutoRefreshWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback onRefresh;

  const AutoRefreshWrapper({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  State<AutoRefreshWrapper> createState() => _AutoRefreshWrapperState();
}

class _AutoRefreshWrapperState extends State<AutoRefreshWrapper> {
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 5), (timer) {
      widget.onRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
