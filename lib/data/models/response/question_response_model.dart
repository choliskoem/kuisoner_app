class QuestionResponseModel {
  final bool success;
  final String message;
  final List<Datum> data;

  QuestionResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory QuestionResponseModel.fromJson(Map<String, dynamic> json) =>
      QuestionResponseModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String idQuestion;
  final String question;
  final List<Option> option;

  Datum({
    required this.idQuestion,
    required this.question,
    required this.option,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idQuestion: json["id_question"],
        question: json["question"],
        option:
            List<Option>.from(json["option"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_question": idQuestion,
        "question": question,
        "option": List<dynamic>.from(option.map((x) => x.toJson())),
      };
}

class Option {
  final String idOption;
  final String nameOption;

  Option({
    required this.idOption,
    required this.nameOption,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        idOption: json["id_option"],
        nameOption: json["name_option"],
      );

  Map<String, dynamic> toJson() => {
        "id_option": idOption,
        "name_option": nameOption,
      };
}
