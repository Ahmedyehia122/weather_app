import 'package:dio/dio.dart';
import 'package:weather_app/models/news_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);
  String baseUrl = 'https://newsapi.org/v2';
  String apiKey = '90c53f2fc324457784dac538e75b3ced';

  getNews() async {
    Response response =
        await dio.get('$baseUrl/everything?q=bitcoin&apiKey=$apiKey');
    Map<String, dynamic> josnData = response.data;
    List<dynamic> articles = josnData['articles'];
    List<ArticleModel> articleList = [];
    for (var article in articles) {
      ArticleModel articleModel = ArticleModel.fromJosn(article);
      articleList.add(articleModel);
    }
  }
}

class ServicesA {
  final Dio dio;

  ServicesA({required this.dio});
  Future getAllNews() async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/everything?q=bitcoin&apiKey=90c53f2fc324457784dac538e75b3ced');
      Map<String, dynamic> josnData = response.data;
      List articles = josnData['articles'];
      List articleList = [];
      for (var article in articles) {
        AModel aModel = AModel.fromJosn(article);
        articleList.add(aModel);
      }
      return articleList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
