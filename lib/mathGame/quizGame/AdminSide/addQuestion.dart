import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_screen/mathGame/quizGame/controller/qustionList.dart';

class SelectedDynamicClass extends StatefulWidget {
  final String className;
  const SelectedDynamicClass({super.key, required this.className});

  @override
  State<SelectedDynamicClass> createState() => _SelectedDynamicClassState();
}

class _SelectedDynamicClassState extends State<SelectedDynamicClass> {
  final addQuestionController = Get.put(QuestionsList());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.className,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          )),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  child: const Text(
                    'Here Add Question :- ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                TextField(
                  controller: addQuestionController.question,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    border: OutlineInputBorder(),
                    labelText: '',
                    // labelStyle: const TextStyle(color: Colors.greenAccent)
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Here Add Options :- ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                TextField(
                  controller: addQuestionController.option1,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'option 1',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: TextField(
                    controller: addQuestionController.option2,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'option 2',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: TextField(
                    controller: addQuestionController.option3,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'option 3',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: TextField(
                    controller: addQuestionController.option4,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'option 4',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: AlignmentDirectional.topStart,
                  child: const Text(
                    'Here Add Answer :- ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: TextField(
                    controller: addQuestionController.answer,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Enter Answer',
                    ),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.topEnd,
                  margin: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {
                      // print('0-0--0-0--0--00--0-');
                      addQuestionController.getClassName(widget.className);
                      addQuestionController.getValues(
                        addQuestionController.question.text,
                        addQuestionController.option1.text,
                        addQuestionController.option2.text,
                        addQuestionController.option3.text,
                        addQuestionController.option4.text,
                        addQuestionController.answer.text,
                      );
                    },
                    child: const Text(
                      'Submit',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
