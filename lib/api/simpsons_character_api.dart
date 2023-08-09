import 'package:anywhere_coding_exercise/api/api_manager.dart';
import 'package:anywhere_coding_exercise/api/result.dart';
import 'package:dio/dio.dart';

class SimpsonsCharacterApi {
  Dio dio = ApiManager().dio;

  Future<Result> getSimpsonsCharacters() async {
    try {
      Response response = await dio
          .get("http://api.duckduckgo.com/?q=simpsons+characters&format=json");
      // create model
      return Success(response);
    } on DioException catch (e) {
      return Failure(e.message);
    }
  }
}
