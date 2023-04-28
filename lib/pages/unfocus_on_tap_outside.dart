import 'package:flutter/material.dart';

class UnfocusArea extends StatelessWidget {
  const UnfocusArea({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Makes clickable on everywhere even if the widget is not opaque
      behavior: HitTestBehavior.opaque,
      // Magic happens here
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}

class UnfocusOnTapOutside extends StatelessWidget {
  const UnfocusOnTapOutside({super.key});

  @override
  Widget build(BuildContext context) {
    // Reusable widget for easier usage
    return UnfocusArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Unfocus on tap outside'),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(hintText: 'Click here to focus'),
            ),
          ),
        ),
      ),
    );
  }
}
