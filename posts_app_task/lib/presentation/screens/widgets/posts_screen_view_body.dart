import 'package:flutter/material.dart';
import '../../../data/models/posts_model.dart';
import '../../../data/services/api_services.dart';

class PostScreenViewBody extends StatefulWidget {
  const PostScreenViewBody({super.key});

  @override
  PostScreenViewBodyState createState() => PostScreenViewBodyState();
}

class PostScreenViewBodyState extends State<PostScreenViewBody> {
  final ApiService _apiService = ApiService();
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    try {
      final posts = await _apiService.getPosts();
      setState(() {
        _posts = posts;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            final post = _posts[index];
            return Card(
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),

              ),
            );
          },
        ),
      ),
    );
  }
}