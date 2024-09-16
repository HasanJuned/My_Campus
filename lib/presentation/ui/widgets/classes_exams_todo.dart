import 'package:flutter/material.dart';

class ClassesExamsToDo extends StatefulWidget {
  const ClassesExamsToDo({
    super.key,
    required this.classes,
    required this.exams,
    required this.myTodo,
    required this.classAndTime,
  });

  final String classes;
  final String exams;
  final String myTodo;
  final String? classAndTime;

  @override
  State<ClassesExamsToDo> createState() => _ClassesExamsToDoState();
}

class _ClassesExamsToDoState extends State<ClassesExamsToDo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Stack(
          alignment: const Alignment(0, 0),
          children: [
            const SizedBox(
              width: 355,
              height: 150,
              child: Card(
                elevation: 3,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  side: BorderSide(color: Color(0x999B9B9B), width: 1),
                ),
                color: Color(0xFFCBD0F9),
              ),
            ),
            const Positioned(
              top: 10, // Adjust top position as needed
              child: Text(
                "Today's Schedule",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      width: 80,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.classes,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const Text(
                            "Classes",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      width: 80,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.exams,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const Text(
                            "Exams",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      width: 80,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.myTodo,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const Text(
                            "ToDo",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: 355,
          height: 45,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
              side: BorderSide(color: Color(0x999B9B9B), width: 1),
            ),
            color: Colors.white,
            child: Center(
              child: Text(
                widget.classAndTime!,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF393939)),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
