import 'dart:convert';

import 'package:anywhere_coding_exercise/api/api_manager.dart';
import 'package:anywhere_coding_exercise/api/result.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart';
import 'package:dio/dio.dart';

class CharactersApi {
  Dio dio = ApiManager().dio;

  Future<Result> getCharacters({required String url}) async {
    try {
      Response response = await dio.get("http://api.duckduckgo.com/?q=$url");
      var data = jsonDecode(response.data);
      CharacterInfo character = CharacterInfo.fromJson(data);
      return Success(character);
    } on DioException catch (e) {
      return Failure(e.message);
    }
  }
}
