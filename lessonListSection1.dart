import 'package:flutter/material.dart';
import 'lessonView.dart';
import 'lessonManager.dart';


// Navigator.push(context, MaterialPageRoute(builder: (context) => const LessonView(lessonText: 'Hello, how are you?', answerText: 'rizz', translateTo: 'Kaigen')));
// Lesson 1 

final List<Map<String, String>> lessonQuestionsS1U1L1 = [
  {
    'lessonText': 'Kafira',
    'answerText': 'Hello',
    'translateTo': 'English',
  },
  {
    'lessonText': 'Hello',
    'answerText': 'Kafira',
    'translateTo': 'Kaigen',
  },
  {
    'lessonText': 'Kadiz?',
    'answerText': 'How?',
    'translateTo': 'English',
  },
  {
    'lessonText': 'How?',
    'answerText': 'Kadiz?',
    'translateTo': 'Kaigen',
  },
  {
    'lessonText': 'Kadiz seu ta?',
    'answerText': 'How are you?',
    'translateTo': 'Kaigen',
  },
];




class LessonFlowS1U1L1 extends StatefulWidget {
  const LessonFlowS1U1L1({super.key});

  @override
  State<LessonFlowS1U1L1> createState() => _LessonFlowS1U1L1State();
}

class _LessonFlowS1U1L1State extends State<LessonFlowS1U1L1> {
  int currentQuestion = 0;
  


  void Progressify() async {
    final lessonMaster = LessonMaster();
    final userProgress = await lessonMaster.getCurrentUserProgress();
    if (userProgress != null) {
      lessonMaster.lF(userProgress, 1,1,2,2);
     }
  }





  void nextQuestion() {
    setState(() {
      currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= lessonQuestionsS1U1L1.length && correctAnswers >= 3) {
      // Lesson complete
      Progressify();
      correctAnswers = 0;
      return Scaffold(
        appBar: AppBar(title: const Text('Lesson Complete')),
        body: Center(
          child: Text('Congratulations! You finished the lesson.'),
        ),
      );
      
    }
    if (currentQuestion >= lessonQuestionsS1U1L1.length && correctAnswers < 3) {
      // Lesson complete
      Progressify();
      correctAnswers = 0;
      return Scaffold(
        appBar: AppBar(title: const Text('Lesson Failed')),
        body: Center(
        child: Text('sad no no pass :('),
        ),
      );
      
    }
    

    final question = lessonQuestionsS1U1L1[currentQuestion];

    return LessonView(
      lessonText: question['lessonText']!,
      answerText: question['answerText']!,
      translateTo: question['translateTo']!,
      onCorrect: nextQuestion, // Pass a callback for correct answer
    );
  }
}
















final List<Map<String, String>> lessonQuestionsS1U1L2 = [
  {
    'lessonText': 'Kadiz seu ta?',
    'answerText': 'How are you?',
    'translateTo': 'English',
  },
  {
    'lessonText': 'Lu',
    'answerText': 'I',
    'translateTo': 'English',
  },
  {
    'lessonText': 'Kadi!',
    'answerText': 'Good!',
    'translateTo': 'English',
  },
  {
    'lessonText': 'Lu seu kadi',
    'answerText': 'I am good',
    'translateTo': 'English',
  },
  {
    'lessonText': 'Ban ta?',
    'answerText': 'And you?',
    'translateTo': 'English',
  },
];




class LessonFlowS1U1L2 extends StatefulWidget {
  const LessonFlowS1U1L2({super.key});

  @override
  State<LessonFlowS1U1L2> createState() => _LessonFlowS1U1L2State();
}

class _LessonFlowS1U1L2State extends State<LessonFlowS1U1L2> {
  int currentQuestion = 0;
  


  void Progressify() async {
    final lessonMaster = LessonMaster();
    final userProgress = await lessonMaster.getCurrentUserProgress();
    if (userProgress != null) {
      lessonMaster.lF(userProgress, 1,1,3,3);
     }
  }





  void nextQuestion() {
    setState(() {
      currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= lessonQuestionsS1U1L1.length && correctAnswers >= 3) {
      // Lesson complete
      Progressify();
      return Scaffold(
        appBar: AppBar(title: const Text('Lesson Complete')),
        body: Center(
          child: Text("Congratulations! You finished the lesson. [It's going to loop back because I don't have time to implement more lessons :( ]"),
        ),
      );
      
    }
    if (currentQuestion >= lessonQuestionsS1U1L2.length && correctAnswers < 3) {
      // Lesson complete
      Progressify();
      return Scaffold(
        appBar: AppBar(title: const Text('Lesson Failed')),
        body: Center(
        child: Text('sad no no pass :('),
        ),
      );
      
    }
    

    final question = lessonQuestionsS1U1L2[currentQuestion];

    return LessonView(
      lessonText: question['lessonText']!,
      answerText: question['answerText']!,
      translateTo: question['translateTo']!,
      onCorrect: nextQuestion, // Pass a callback for correct answer
    );
  }
}





