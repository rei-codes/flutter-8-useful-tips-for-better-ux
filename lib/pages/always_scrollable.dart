import 'dart:developer';

import 'package:flutter/material.dart';

class AlwaysScrollable extends StatelessWidget {
  const AlwaysScrollable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Always scrollable'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => log('refreshed'),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
            // Magic happens here
            // Lets the listview scroll even the items is not enough to fill the entire screen
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: 3,
          itemBuilder: (_, i) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text('$i'),
              ),
            );
          },
        ),
      ),
    );
  }
}
