import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String question;
  final String answer;

  const DetailPage({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("결과")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(question),
            const SizedBox(height: 20),
            Text(answer),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text("뒤로가기"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
