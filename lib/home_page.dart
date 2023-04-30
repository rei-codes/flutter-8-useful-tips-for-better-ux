import 'package:flutter/material.dart';

import 'pages/always_scrollable.dart';
import 'pages/auto_focus_on_open.dart';
import 'pages/ensure_text_field_visible.dart';
import 'pages/next_focus_on_enter.dart';
import 'pages/remember_scroll_position.dart';
import 'pages/tap_again_to_exit.dart';
import 'pages/unfocus_on_scroll.dart';
import 'pages/unfocus_on_tap_outside.dart';

extension NavigatorExtension on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Always scrollable'),
                onPressed: () => context.push(const AlwaysScrollable()),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Auto focus on open'),
                onPressed: () => context.push(const AutoFocusOnOpen()),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Ensure texfield is visible'),
                onPressed: () => context.push(const EnsureTextFieldVisible()),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Next focus on enter'),
                onPressed: () => context.push(const NextFocusOnEnter()),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Remember scroll position'),
                onPressed: () => context.push(const RememberScrollPosition()),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Tap again to exit'),
                onPressed: () => context.push(const TapAgainToExit()),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Unfocus on scroll'),
                onPressed: () => context.push(const UnfocusOnScroll()),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Unfocus on tap outside'),
                onPressed: () => context.push(const UnfocusOnTapOutside()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
