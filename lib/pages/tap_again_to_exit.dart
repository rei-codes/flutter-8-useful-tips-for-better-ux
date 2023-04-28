import 'dart:developer';

import 'package:flutter/material.dart';

class DoubleBack extends StatefulWidget {
  const DoubleBack({super.key, required this.child});
  final Widget child;

  @override
  State<DoubleBack> createState() => _DoubleBackState();
}

class _DoubleBackState extends State<DoubleBack> {
  DateTime? pressedTime;

  Future<bool> tapAgainToExitToast([String? text]) async {
    final now = DateTime.now();

    // If pressed to back button before and haven't passed 2 seconds yet, go back.
    // Otherwise do nothing
    if (pressedTime == null ||
        now.difference(pressedTime!) > const Duration(seconds: 2)) {
      // updates the pressed time
      pressedTime = now;

      // I didn't want to include any package into this project
      // but you can add your toast message here :)
      log('Tap again to exit');
      // do not pop the route
      return false;
    }
    // pop the route
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // on back pressed
      onWillPop: tapAgainToExitToast,
      child: widget.child,
    );
  }
}

// It is useful only for android devices
class TapAgainToExit extends StatelessWidget {
  const TapAgainToExit({super.key});

  @override
  Widget build(BuildContext context) {
    // Magic Happens here
    // A WillPopScope wrapper widget to make the feature reusable
    return DoubleBack(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tap again to exit'),
        ),
        body: const Center(
          child: Text('Press on the back button 2 times to exit the app'),
        ),
      ),
    );
  }
}
