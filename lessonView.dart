
// this is going to be bad isn't it...
// I'm going to regret this, arn't I?

//import 'main.dart';
//import 'lessonManager.dart';
//import 'lessonListSection1.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
  int correctAnswers = 0;
  double lessonProgress = correctAnswers / 5;
// LessonView widget to display the lesson content
class LessonView extends StatefulWidget {
  final String lessonText; // Text for the lesson
  final String translateTo;
  final String answerText;
  final String ?userAnswer;
  final VoidCallback? onCorrect; 
  
  

  const LessonView({
    super.key,
    required this.translateTo,
    required this.lessonText,
    required this.answerText,
    this.userAnswer,
    this.onCorrect,
  });

  @override
  State<LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  final _answerController = TextEditingController();



  void verifyAnswer() {
    String userAnswer = _answerController.text.trim();
    if (userAnswer.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter an answer'), duration: Duration(milliseconds: 300), backgroundColor: Color.fromRGBO(118, 223, 255, 1)),
      );
      return;
    }

    if (userAnswer == widget.answerText) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correct!'), backgroundColor: Color.fromRGBO(158, 255, 134, 1), duration: Duration(milliseconds: 500)),
      );
      _answerController.clear();
      if (widget.onCorrect != null) {
        Future.delayed(const Duration(milliseconds: 500), widget.onCorrect!);
        correctAnswers++;
        lessonProgress = correctAnswers/5;
        
        //print(correctAnswers);
        //print(lessonProgress);
      } // You can put ummm number of correct answers here.
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect Answer: ${widget.answerText}'), backgroundColor: Color.fromRGBO(255, 121, 150, 1), duration: Duration(milliseconds: 1000)),
      );
      _answerController.clear();
      if (widget.onCorrect != null) {
        Future.delayed(const Duration(milliseconds: 500), widget.onCorrect!);
        lessonProgress = correctAnswers/5;
      }
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(value: lessonProgress,),
            SizedBox(height: 20),
            Text('Translate to ${widget.translateTo}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        widget.lessonText, // Use the passed-in lesson text
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 100,),
                Image.asset(
                  "assets/images/Mascot.png",
                  fit: BoxFit.fill,
                  height: 200,
                  width: 150,
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: TextField(
                autocorrect: true,
                maxLines: 9,
                minLines: 9,
                controller: _answerController,
                decoration: InputDecoration(
                  labelText: "Answer Here",
                  border: OutlineInputBorder(),
                  fillColor: Color.fromRGBO(251, 184, 181, 1),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  verifyAnswer(); // Call the method to verify the answer
                },
                backgroundColor: Color.fromRGBO(251, 184, 181, 1),
                child: Center(child: Icon(Icons.play_arrow)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



