import 'package:flutter/material.dart';

class RememberScrollPosition extends StatefulWidget {
  const RememberScrollPosition({super.key});

  @override
  State<RememberScrollPosition> createState() => _RememberScrollPositionState();
}

class _RememberScrollPositionState extends State<RememberScrollPosition> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remember scroll position'),
      ),
      body: const [
        Page(name: 'First'),
        Page(name: 'Second'),
        Page(name: 'Third'),
      ][currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Magic happens here
      // Caches the scroll position on the key
      key: PageStorageKey(name),
      itemBuilder: (_, i) => Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text('Page $name - $i'),
        ),
      ),
    );
  }
}
