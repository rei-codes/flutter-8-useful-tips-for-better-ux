import 'package:flutter/material.dart';

class AutoFocusOnOpen extends StatelessWidget {
  const AutoFocusOnOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto focus on open'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            // Magic happens here
            // makes the app focus immediately after widget built
            autofocus: true,
            decoration: InputDecoration(hintText: 'Search'),
          ),
        ),
      ),
    );
  }
}
