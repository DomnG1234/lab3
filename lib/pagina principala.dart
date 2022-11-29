import 'package:flutter/material.dart';
import 'package:lab_quiz/pagina quiz.dart';

class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/1.png', height: 256,width: 256),

                ]
            ),
            const Spacer(flex: 6),
            Text("Math for\neveryone",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black, fontWeight: FontWeight.w600, fontSize: 55
              ),
            ),
            const Spacer(flex: 6),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QuizScreen()));
              },
              child: Container(
                width: 200,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20*0.5),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Text (
                  "Start",
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1), //Spatiu
          ],
        ),
      ),
      ),
    );
  }
}
