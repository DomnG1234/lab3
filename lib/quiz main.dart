class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(
      Question("Valoarea expresiei: 2+2*2=... ?",
          [
            Answer("A. 8", false),
            Answer("B. -1/2", false),
            Answer("C. -8", false),
            Answer("D. 6", true),
          ]
      )
  );

  list.add(
      Question("Valoarea expresiei: 3+3*3=...  ?",
          [
            Answer("A. 5", false),
            Answer("B. 6", false),
            Answer("C. 1/2", false),
            Answer("D. 12", true),
          ]
      )
  );
  list.add(
      Question("Valoarea expresiei: 2.10/3=... ?",
          [
            Answer("A. 0.70", true),
            Answer("B. 0.50", false),
            Answer("C. 0.80", false),
            Answer("D. 2.1", false),
          ]
      )
  );

  list.add(
      Question("Valoarea expresiei: 23 + 6 / 3=... ?",
          [
            Answer("A. 24", false),
            Answer("B. 25", true),
            Answer("C. 26", false),
            Answer("D. 27", false),
          ]
      )
  );


  list.add(
      Question("Valoarea expresiei 100 * 0 +10 / 5 ? ",
          [
            Answer("A.  102", false),
            Answer("B. 2",  true),
            Answer("C. 0", false),
            Answer("D. 103", false),
          ]
      )
  );

  list.add(
      Question("Sqrt(10000)=... ?",
          [
            Answer("A.  100", true),
            Answer("B. 99",  false),
            Answer("C. 150", false),
            Answer("D. 200", false),
          ]
      )
  );

  list.add(
      Question("Pow(10,2)=... ?",
          [
            Answer("A.  225", false),
            Answer("B. 64",  false),
            Answer("C. 121", false),
            Answer("D. 100", true),
          ]
      )
  );
  return list;
}