import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lab_quiz/quiz main.dart';
import 'package:lab_quiz/pagina principala.dart';
class ScoreScreen extends StatelessWidget {

  final int answeredQuestions;
  final int correctAnsweredQuestions;
  final int quizTime;

  const ScoreScreen({
    super.key,
    required this.answeredQuestions,
    required this.correctAnsweredQuestions,
    required this.quizTime
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey,
              width: 1
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _addGroupItem(context, "New Rating", "${correctAnsweredQuestions / 2}"),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                _addGroupItem(context, "Correct", "$correctAnsweredQuestions/$answeredQuestions"),
                _addGroupItem(context, "Completed in", _formatTime(quizTime))
              ],
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () => exit(0),
              child: Container(
                width: 270,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20 * 0.75),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text (
                  "Leave",
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WelcomeScreen()));
              },
              child: Container(
                width: 270,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20 * 0.75),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text (
                  "New Game",
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(int time) {
    Duration duration = Duration(milliseconds: time * 1000);

    return [duration.inHours, duration.inMinutes, duration.inSeconds]
        .map((part) => part.remainder(60).toString().padLeft(2, '0'))
        .join(":");
  }

  _addGroupItem(BuildContext context, String title, String value) {
    return SizedBox(
        width: 120,
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Colors.grey
              ),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900
              ),
            ),
          ],
        )
    );
  }
}
