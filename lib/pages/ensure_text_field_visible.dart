import 'package:flutter/material.dart';

class EnsureTextFieldVisible extends StatelessWidget {
  const EnsureTextFieldVisible({super.key});

  @override
  Widget build(BuildContext context) {
    // for validation
    final key = GlobalKey();
    // to learn the position of the widget
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ensure textfield is visible'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 1024),
              Padding(
                padding: const EdgeInsets.all(32),
                child: TextFormField(
                  key: key,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Look over here!',
                  ),
                ),
              ),
              const SizedBox(height: 128),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          if (!formKey.currentState!.validate()) {
            // Magic happens here
            // Gets the item's position and ensures it is visible on the screen
            Scrollable.ensureVisible(
              key.currentContext!,
              duration: const Duration(milliseconds: 350),
            );
          }
        },
      ),
    );
  }
}
