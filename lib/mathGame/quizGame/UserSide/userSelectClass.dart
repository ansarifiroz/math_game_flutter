import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_screen/mathGame/quizGame/controller/qustionList.dart';
import 'package:splash_screen/mathGame/quizGame/model/questionModel.dart';

class UserSelectClass extends StatefulWidget {
  final String className;
  const UserSelectClass({super.key, required this.className});

  @override
  State<UserSelectClass> createState() => _UserSelectClassState();
}

class _UserSelectClassState extends State<UserSelectClass> {
  final questionsListController = Get.put(QuestionsList());
  var correctAnswerColor = Colors.white;
  // bool opt1 = false;
  // bool opt2 = false;
  // bool opt3 = false;
  // bool opt4 = false;
  var storeOption;
  List<QuestionModel> allSelectedClassMCQList = <QuestionModel>[].obs;
  // var allSelectedClassMCQList = [];
  @override
  void initState() {
    allSelectedClassMCQList = [];
    if (widget.className == 'Class 1') {
      allSelectedClassMCQList =
          questionsListController.completeQuestionListClass1;
    } else if (widget.className == 'Class 2') {
      allSelectedClassMCQList =
          questionsListController.completeQuestionListClass2;
    } else if (widget.className == 'Class 3') {
      allSelectedClassMCQList =
          questionsListController.completeQuestionListClass3;
    } else if (widget.className == 'Class 4') {
      allSelectedClassMCQList =
          questionsListController.completeQuestionListClass4;
    } else if (widget.className == 'Class 5') {
      allSelectedClassMCQList =
          questionsListController.completeQuestionListClass5;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void answerMatch(answer) {
      // if (storeOption == answer) {
      //   correctAnswerColor = Colors.green;
      // } else {
      //   correctAnswerColor = Colors.white;
      // }
      // setState(() {});
    }

    return Scaffold(
        appBar: AppBar(
            title: Text(widget.className,
                style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.w700))),
        body: Obx(() => ListView(
            children: allSelectedClassMCQList
                .map((e) {
                  int index = allSelectedClassMCQList.indexOf(e);
                  var questionName = allSelectedClassMCQList[index].question;
                  var option1 = allSelectedClassMCQList[index].option1;
                  var option2 = allSelectedClassMCQList[index].option2;
                  var option3 = allSelectedClassMCQList[index].option3;
                  var option4 = allSelectedClassMCQList[index].option4;
                  var answer = allSelectedClassMCQList[index].answer;
                  var idx =
                      questionsListController.completeQuestionListClass1[index];
                  return ListTile(
                    title: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            alignment: AlignmentDirectional.topStart,
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Q. $questionName –',
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              storeOption = option1;
                              answerMatch(answer);
                            },
                            child: Container(
                                alignment: AlignmentDirectional.topStart,
                                child: Text('(a) $option1',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () {
                              storeOption = option2;
                              answerMatch(answer);
                            },
                            child: Container(
                                alignment: AlignmentDirectional.topStart,
                                child: Text('(b) $option2',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () {
                              storeOption = option3;
                              answerMatch(answer);
                            },
                            child: Container(
                                alignment: AlignmentDirectional.topStart,
                                child: Text('(c) $option3',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () {
                              storeOption = option4;
                              answerMatch(answer);
                            },
                            child: Container(
                                alignment: AlignmentDirectional.topStart,
                                child: Text('(d) $option4',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  );
                })
                .toList()
                .obs)));
  }
}
