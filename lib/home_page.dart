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
      body: Column(children: [
        FutureBuilder(
            future: Hive.openBox('sadan'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.get('name').toString()),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {});
                          snapshot.data!.put('name', 'Congratulations');
                        },
                        icon: Icon(Icons.edit),
                      ),
                      subtitle: Text(snapshot.data!.get('age').toString()),
                    )
                  ],
                );
              } else {
                return Text('Loading...');
              }
            }),
        FutureBuilder(
            future: Hive.openBox('waleed'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.get('name').toString()),
                    )
                  ],
                );
              } else {
                return Text('Loading...');
              }
            }),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox('sadan');
          var box1 = await Hive.openBox('waleed');

          box1.put('name', 'Waleed Khan');
          box.put('name', 'sadan ali');
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
