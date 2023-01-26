import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Hive DataBase'))),
      body: Column(children: []),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox('sadan');

          box.put('name', 'sadan');
          box.put('age', 24);

          box.put('details', {
            'nickname': 'programmer',
            'pro': 'developer',
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
