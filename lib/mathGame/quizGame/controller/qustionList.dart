import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_screen/mathGame/quizGame/model/questionModel.dart';

class QuestionsList extends GetxController {
  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController answer = TextEditingController();
  List<QuestionModel> completeQuestionListClass1 = <QuestionModel>[].obs;
  List<QuestionModel> completeQuestionListClass2 = <QuestionModel>[].obs;
  List<QuestionModel> completeQuestionListClass3 = <QuestionModel>[].obs;
  List<QuestionModel> completeQuestionListClass4 = <QuestionModel>[].obs;
  List<QuestionModel> completeQuestionListClass5 = <QuestionModel>[].obs;
  late String className;

  void getClassName(value) {
    className = value;
  }

  void getValues(question, option1, option2, option3, option4, answer) {
    if (className == 'Class 1') {
      completeQuestionListClass1.add(QuestionModel(
          question: question,
          option1: option1,
          option2: option2,
          option3: option3,
          option4: option4,
          answer: answer));
    } else if (className == 'Class 2') {
      completeQuestionListClass2.add(QuestionModel(
          question: question,
          option1: option1,
          option2: option2,
          option3: option3,
          option4: option4,
          answer: answer));
    } else if (className == 'Class 3') {
      completeQuestionListClass3.add(QuestionModel(
          question: question,
          option1: option1,
          option2: option2,
          option3: option3,
          option4: option4,
          answer: answer));
    } else if (className == 'Class 4') {
      completeQuestionListClass4.add(QuestionModel(
          question: question,
          option1: option1,
          option2: option2,
          option3: option3,
          option4: option4,
          answer: answer));
      print('class 44');
    } else if (className == 'Class 5') {
      completeQuestionListClass5.add(QuestionModel(
          question: question,
          option1: option1,
          option2: option2,
          option3: option3,
          option4: option4,
          answer: answer));
    }
  }
}
