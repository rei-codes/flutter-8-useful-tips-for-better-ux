import 'package:flutter/material.dart';

class UnfocusOnScroll extends StatelessWidget {
  const UnfocusOnScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unfocus on scroll'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(hintText: 'Click here to focus'),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        // Magic happens here
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, i) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Text('card $i'),
            ),
          );
        },
      ),
    );
  }
}
