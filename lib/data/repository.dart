import 'package:flutter/material.dart';
import 'package:test_project/models/question_level.dart';
import 'package:test_project/models/question_model.dart';
import 'package:test_project/models/subject_model.dart';

class AppRepository {
  static List<SubjectModel> subjects = [
    SubjectModel(
      subjectName: "Math",
      iconPath: "assets/images/math.png",
      color: Colors.teal,
      questions: [
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: 1,
          questionText: "5 x 20 = ?",
          answer4: "70",
          answer3: "80",
          answer2: "90",
          answer1: "100",
        ),
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: 3,
          questionText: "100 / 5 = ?",
          answer4: "30",
          answer3: "20",
          answer2: "15",
          answer1: "12",
        ),
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: 4,
          questionText: "100 / 20 = ?",
          answer4: "5",
          answer3: "10",
          answer2: "8",
          answer1: "7",
        ),
        QuestionModel(
          level: QuestionLevel.easy,
          trueAnswer: 3,
          questionText: "6 x 2 = ?",
          answer4: "13",
          answer3: "12",
          answer2: "10",
          answer1: "7",
        ),
        QuestionModel(
          trueAnswer: 2,
          answer4: "bnsdfbd ffsg",
          answer3: "gffdgd fgddg ",
          answer2: "Correct answer",
          answer1: " fgdg  fgdfg",
          questionText: "What is real numbers ?",
        ),
      ],
    ),
    SubjectModel(
      subjectName: "English",
      iconPath: "assets/images/english.png",
      color: Colors.red,
      questions: [
        QuestionModel(
          trueAnswer: 4,
          answer4: "a",
          answer3: "am",
          answer2: "an",
          answer1: "the",
          questionText: "I am ... student",
        ),
      ],
    ),
    SubjectModel(
      subjectName: "Physics",
      iconPath: "assets/images/physics.png",
      color: Colors.indigo,
      questions: [
        QuestionModel(
          trueAnswer: 2,
          answer4: "2.17",
          answer3: "3.14",
          answer2: "9.81",
          answer1: "1.98",
          questionText: "What is the value ov gravitation constant ?",
        ),
        QuestionModel(
          trueAnswer: 4,
          answer4: "Acceleration is the rate of change of velocity. Usually, acceleration means the speed is changing, but not always. When an object moves in a circular path at a constant speed, it is still accelerating, because the direction of its velocity is changing.",
          answer3: "So can we have a situation when speed remains constant but the body is accelerated? Actually, it is possible in a circle where speed remains constant but since the direction is changing hence the velocity changes, and the body is said to be accelerated.",
          answer2: "The average acceleration over a period of time is defined as the total change in velocity in the given interval divided by the total time taken for the change. For a given interval of time, it is denoted as ā.",
          answer1: "Average acceleration: In the velocity-time graph shown above, the slope of the line between the time interval t1 and t2 gives the average value for the rate of change of velocity for the object during the time t1 and t2.",
          questionText: "What is acceleration? ",
        ),
      ],
    ),
  ];
}
