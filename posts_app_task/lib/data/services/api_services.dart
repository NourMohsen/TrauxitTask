import 'package:dio/dio.dart';
import '../models/posts_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Post>> getPosts() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      final data = response.data as List<dynamic>;
      final posts = data.map((json) => Post.fromJson(json)).toList();
      return posts;
    } catch (error) {
      throw Exception('Failed to fetch posts');
    }
  }
}