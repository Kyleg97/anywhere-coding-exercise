import 'package:anywhere_coding_exercise/api/api_manager.dart';
import 'package:anywhere_coding_exercise/api/result.dart';
import 'package:dio/dio.dart';

class WireCharacterApi {
  Dio dio = ApiManager().dio;

  Future<Result> getWireCharacters() async {
    try {
      Response response = await dio
          .get("http://api.duckduckgo.com/?q=the+wire+characters&format=json");
      // create model
      return Success(response);
    } on DioException catch (e) {
      return Failure(e.message);
    }
  }
}
