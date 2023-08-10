import 'dart:convert';

import 'package:anywhere_coding_exercise/api/api_manager.dart';
import 'package:anywhere_coding_exercise/api/result.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart';
import 'package:dio/dio.dart';

class CharactersApi {
  Dio dio = ApiManager().dio;

  Future<Result> getSimpsonsCharacters() async {
    try {
      Response response = await dio
          .get("http://api.duckduckgo.com/?q=simpsons+characters&format=json");
      var data = jsonDecode(response.data);
      CharacterInfo character = CharacterInfo.fromJson(data);
      /*List<Character> simpsonsCharacters = List<Character>.from(
          data.map((character) => Character.fromJson(character)));*/
      return Success(character);
    } on DioException catch (e) {
      return Failure(e.message);
    }
  }

  Future<Result> getWireCharacters() async {
    try {
      Response response = await dio
          .get("http://api.duckduckgo.com/?q=the+wire+characters&format=json");
      // decode json
      return Success(response);
    } on DioException catch (e) {
      return Failure(e.message);
    }
  }
}
