import 'package:flutter/material.dart';

class NextFocusOnEnter extends StatelessWidget {
  const NextFocusOnEnter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next focus on enter'),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(hintText: 'First'),
              // Magic happens here
              // Switches the focus to the next widget
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(hintText: 'Second'),
            ),
          ),
        ],
      ),
    );
  }
}
