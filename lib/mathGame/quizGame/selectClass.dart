import 'package:flutter/material.dart';
import 'package:splash_screen/mathGame/quizGame/AdminSide/addQuestion.dart';
import 'package:splash_screen/mathGame/quizGame/UserSide/userSelectClass.dart';

class SelectClass extends StatefulWidget {
  final String user;
  const SelectClass({super.key, required this.user});

  @override
  State<SelectClass> createState() => _SelectClassState();
}

class _SelectClassState extends State<SelectClass> {
  List<String> classNameList = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select class',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: classNameList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (widget.user == 'admin') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectedDynamicClass(
                                    className: classNameList[index])),
                          );
                        } else if (widget.user == 'user') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserSelectClass(
                                    className: classNameList[index])),
                          );
                        }
                      },
                      child: Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          classNameList[index],
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white54,
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }
}
