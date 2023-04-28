import 'package:flutter/material.dart';

class EnsureCardVisible extends StatelessWidget {
  const EnsureCardVisible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ensure card visible'),
      ),
      body: ListView.builder(
        itemBuilder: (_, i) {
          final key = GlobalKey(debugLabel: 'card $i');
          return GestureDetector(
            key: key,
            onTap: () {
              final target = key.currentContext;
              if (target != null) {
                // Magic happens here
                // Gets the item's position and take it to the top of the scroll
                Scrollable.ensureVisible(
                  target,
                  duration: const Duration(milliseconds: 350),
                );
              }
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text('Card $i'),
              ),
            ),
          );
        },
      ),
    );
  }
}
