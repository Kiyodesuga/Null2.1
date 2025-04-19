import 'package:flutter/material.dart';

class ThoughtLogScreen extends StatelessWidget {
  const ThoughtLogScreen({Key? key}) : super(key: key);
  @override Widget build(BuildContext context) {
    final dummy = List.generate(20, (i) => 'Thought #\${i+1} at \${TimeOfDay.now().format(context)}');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black, leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context)), title: const Text('Thought Log', style: TextStyle(color: Colors.white)),
        centerTitle: true, elevation: 0,
      ),
      body: ListView.builder(
        itemCount: dummy.length,
        itemBuilder: (c, idx) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(border: Border.all(color: Colors.white24, width: 0.8), borderRadius: BorderRadius.circular(4)),
          child: Text(dummy[idx], style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
