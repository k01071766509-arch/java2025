import 'package:flutter/material.dart';
import 'dart:convert';
import 'detail_page.dart';

class TestPage extends StatefulWidget {
  final String question;

  const TestPage({super.key, required this.question});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int selectNumber = -1;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> questions = jsonDecode(widget.question);
    List<String> selects = List<String>.from(questions['selects']);

    return Scaffold(
      appBar: AppBar(title: Text(questions['title'].toString())),
      body: Column(
        children: [
          Text(questions['question']),
          Expanded(
            child: ListView.builder(
              itemCount: selects.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(selects[index]),
                  value: index,
                  groupValue: selectNumber,
                  onChanged: (value) {
                    setState(() {
                      selectNumber = index;
                    });
                  },
                );
              },
            ),
          ),
          selectNumber == -1
              ? Container()
              : ElevatedButton(
            child: const Text("결과 보기"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    question: questions['question'],
                    answer: selects[selectNumber],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


