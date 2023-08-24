import 'package:flutter/material.dart';
import 'presentation/screens/posts_screen_view.dart';

void main() {
  runApp(const PostsListApp());
}

class PostsListApp extends StatelessWidget {
  const PostsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts List App',
      home: PostsScreenView(),
    );
  }
}