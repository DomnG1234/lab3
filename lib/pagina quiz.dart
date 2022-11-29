import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:lab_quiz/quiz main.dart';
import 'package:lab_quiz/rezultat.dart';
class QuizScreen extends StatefulWidget {

  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int answeredQuestions = 0;
  int correctAnsweredQuestions = 0;
  int totalQuizTime = 0;
  int questionElapsedTime = 0;
  double progress = 1.0;
  final maxTimePerQuestion = 20;
  Answer? selectedAnswer;

  final _stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond:  20 * 1000
  );

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.secondTime.listen((value) {
      setState(() {
        questionElapsedTime = value;
        progress = progress - (1 / 20);
      });

      if (value == 0) {
        _handleNext();
      }
    });
    _stopWatchTimer.onStartTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Quiz App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),
        ]),
      ),
    );
  }

//vidget pentru intrebare
  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.timer_rounded, color: Colors.grey, size: 18),
            const Divider(height: 8),
            Text(
              "${questionElapsedTime}s",
              style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Colors.grey
              ),
            )
          ],
        ),

        const SizedBox(height: 16),

//Widget pentru bara de timp
        LinearProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.yellow,
            minHeight: 4,
            value: progress
        ),

        const SizedBox(height: 24),
//Widget pentru text
        Text(
          "Question ${currentQuestionIndex + 1} of ${questionList.length}",
          style: const TextStyle(
            color: Colors.black12, fontSize: 20, fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 20),

        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(38),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex].answersList.map((e) => _answerButton(e),).toList(),
    );
  }
//vidget pentru raspuns ales
  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.redAccent: Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.green,
        ),
        onPressed: () {
          if (selectedAnswer == null ) {
            answeredQuestions ++;
            if (answer.isCorrect) {
              correctAnsweredQuestions++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
        child: Text(answer.answerText),
      ),
    );
  }


// submit si next button
  _nextButton () {
    return SizedBox(
      height: 49,
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
        onPressed: _handleNext,
        child: Text(_isLastQuestion() ? "Submit" : "Next"),
        //afisarea rezultatelor

      ),
    );
  }

  _isLastQuestion() => currentQuestionIndex == questionList.length - 1;

  _handleNext() {
    totalQuizTime += maxTimePerQuestion - _stopWatchTimer.secondTime.value;

    setState(() {
      progress = 2;
    });

    _stopWatchTimer.onResetTimer();
    _stopWatchTimer.onStartTimer();

    if (_isLastQuestion()) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ScoreScreen(
              answeredQuestions: answeredQuestions,
              correctAnsweredQuestions: correctAnsweredQuestions,
              quizTime: totalQuizTime
          )
          ));
    } else {
      setState(() {
        selectedAnswer = null;
        currentQuestionIndex++;
      });
    }
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();

  }
}
