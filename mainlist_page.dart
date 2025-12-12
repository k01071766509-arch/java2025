import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'test_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('res/api/list.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("성격 테스트 목록")),
      body: FutureBuilder(
        future: loadAsset(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          Map<String, dynamic> data = jsonDecode(snapshot.data.toString());
          List<dynamic> list = data['list'];

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(list[index]['title']),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestPage(
                          question: list[index]['question'],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

