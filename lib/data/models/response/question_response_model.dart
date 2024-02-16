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
  final String idSchedule;
  final String titelQuestion;
  final String tujuanQuestion;
  final String caraPakaiQuestion;
  final List<Category> category;

  Datum({
    required this.idSchedule,
    required this.titelQuestion,
    required this.tujuanQuestion,
    required this.caraPakaiQuestion,
    required this.category,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idSchedule: json["id_schedule"],
        titelQuestion: json["titel_question"],
        tujuanQuestion: json["tujuan_question"],
        caraPakaiQuestion: json["cara_pakai_question"],
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_schedule": idSchedule,
        "titel_question": titelQuestion,
        "tujuan_question": tujuanQuestion,
        "cara_pakai_question": caraPakaiQuestion,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  final String idCategory;
  final String nameCategory;
  final List<DataCategory> dataCategory;

  Category({
    required this.idCategory,
    required this.nameCategory,
    required this.dataCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        idCategory: json["id_category"],
        nameCategory: json["name_category"],
        dataCategory: List<DataCategory>.from(
            json["data_category"].map((x) => DataCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_category": idCategory,
        "name_category": nameCategory,
        "data_category":
            List<dynamic>.from(dataCategory.map((x) => x.toJson())),
      };
}

class DataCategory {
  final String idQuestion;
  final String question;
  final List<Option> option;

  DataCategory({
    required this.idQuestion,
    required this.question,
    required this.option,
  });

  factory DataCategory.fromJson(Map<String, dynamic> json) => DataCategory(
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
