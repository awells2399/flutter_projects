import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                            color: data['user_answer'] == data['correct_answer']
                                ? Colors.blue
                                : Colors.purpleAccent,
                            shape: BoxShape.circle),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'].toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data['user_answer'].toString(),
                              style: TextStyle(color: Colors.purple.shade400),
                            ),
                            Text(
                              "${data['correct_answer']}",
                              style:
                                  TextStyle(color: Colors.lightBlue.shade300),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
