import 'package:appgain_flutter_app/constants/strings.dart';
import 'package:dio/dio.dart';

class linksApis {
  late Dio dio;

  linksApis() {
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

  Future<List<dynamic>> getLinks() async {
    try {
      Response response = await dio.get('');
      return response.data['shortLinks'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>> getOneLink(linkID) async {
    Response response =
        await dio.get('getOneLink', queryParameters: {'linkId': linkID});
    return response.data['shortLink'];
  }

  Future<bool> addlink(slug, web, android_primary, android_fallback,
      ios_primary, ios_fallback) async {
    Response response = await dio.post('', data: {
      "slug": slug,
      "ios": {"primary": ios_primary, "fallback": ios_fallback},
      "android": {"primary": android_primary, "fallback": android_fallback},
      "web": web
    });
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
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
