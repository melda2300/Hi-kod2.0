import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = '46840b0449f948e1afaaf48aa7e5946f'; // Buraya kendi API anahtarınızı koyun

  Future<List<dynamic>> fetchNews(String category) async {
    final response = await http.get(Uri.parse('$_baseUrl/top-headlines?country=tr&category=$category&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
