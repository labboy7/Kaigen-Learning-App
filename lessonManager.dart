//import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import 'lessonView.dart';
import 'main.dart';
//import 'lessonListSection1.dart';






// hell


class LessonMaster{
  

  final progressesDatabase = ProgressDatabase();

  Future<Progress?> getCurrentUserProgress() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) return null;
    return await progressesDatabase.fetchProgressByUserId(userId);
  }

  Future<void> lL() async {
    final progress = await getCurrentUserProgress();
    if (progress != null) {
      print('Section: ${progress.section}');
      print('Unit: ${progress.unit}');
      print('Lesson: ${progress.lesson}');
      print('Pathway Level: ${progress.pathway_level}');
    }
  }

  void lR(){
  //change the text of old lessons to Review and change the section sun to match current section

  }

  void lF(Progress progress, int newSection, int newUnit, int newLesson, int newPathway_level){ 
  // - Save/Update the user's progress to the database once they are finished with the lesson //Update
    progressesDatabase.updateProgress(progress, newSection, newUnit, newLesson, newPathway_level);
  }


  void lO(Progress progress){
  // - Delete the user's progress from the database if they want to start over //Delete
    progressesDatabase.deleteProgress(progress);
  }

}