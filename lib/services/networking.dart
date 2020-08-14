import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'dart:async';
import 'package:globalnews/services/article.dart';

class NetworkHelper {
  final String url;
  Response response;
  Dio dio = new Dio();
  List<Article> list = [];

  NetworkHelper(this.url);

  Future<List<Article>> getData() async {
    try {
      dio.interceptors
          .add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);
      response = await dio.get(
        url,
        options: buildCacheOptions(
          Duration(minutes: 1),
          maxStale: Duration(days: 6),
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        var rest = data["articles"] as List;
        list = rest.map<Article>((json) => Article.fromJson(json)).toList();
        return list;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
