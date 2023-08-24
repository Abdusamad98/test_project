
class RemoteQuestionModel {
  RemoteQuestionModel({
    required this.qid,
    required this.sid,
    required this.level,
    required this.trueAnswer,
    required this.questionText,
    required this.answer4,
    required this.answer3,
    required this.answer2,
    required this.answer1,
  });

  final int sid;
  final int qid;
  final String questionText;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String trueAnswer;
  final int level;

  factory RemoteQuestionModel.fromJson(Map<String, dynamic> json) {
    return RemoteQuestionModel(
      sid: json["sid"] as int? ?? 0,
      qid: json["qid"] as int? ?? 0,
      level: json["level"] as int? ?? 0,
      questionText: json["text"] as String? ?? "",
      answer1: json["answer1"] as String? ?? "",
      answer2: json["answer2"] as String? ?? "",
      answer3: json["answer3"] as String? ?? "",
      answer4: json["answer4"] as String? ?? "",
      trueAnswer: json["correctAnswer"] as String? ?? "",
    );
  }
}