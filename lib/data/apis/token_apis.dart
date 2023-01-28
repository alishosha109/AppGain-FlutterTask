import 'package:appgain_flutter_app/constants/strings.dart';
import 'package:dio/dio.dart';

class tokenApis {
  late Dio dio;

  tokenApis() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
      headers: {"authorization": "token $acctoken"},
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    dio = Dio(options);
  }

  Future<String> getToken() async {
    try {
      Response response = await dio.post('getToken',
          queryParameters: {'username': "test", 'id': "1111"});
      return response.data['token'];
    } catch (e) {
      return "";
    }
  }
}
