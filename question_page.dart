import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'detail_page.dart';

class QuestionPage extends StatefulWidget {
  final String question;

  const QuestionPage({super.key, required this.question});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int selectNumber = -1;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> questions = jsonDecode(widget.question);
    List<dynamic> selects = questions['selects'];
    String title = questions['title'].toString();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Text(questions['question'].toString()),
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
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    question: questions['question'],
                    answer: selects[selectNumber],
                  ),
                ),
              );
            },
            child: const Text("결과 보기"),
          ),
        ],
      ),
    );
  }
}

