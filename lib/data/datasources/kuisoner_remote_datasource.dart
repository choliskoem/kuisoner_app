import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:kusioner_ung/data/models/response/question_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import 'auth_local_datasource.dart';

class KuisonerRemoteDatasource {
  Future<Either<String, QuestionResponseModel>> getList() async {
    final autData = await AuthLocalDatasource().getAuthData();
    final response = await http
        .get(Uri.parse('${Variables.baseUrl}/api/survey'), headers: {
      'Authorization': 'Bearer ${autData.token}',
    });
    if (response.statusCode == 200) {
      return right(QuestionResponseModel.fromJson(json.decode(response.body)));
    } else {
      return left(response.body);
    }
  }
}
