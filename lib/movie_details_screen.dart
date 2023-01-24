import 'package:flutter/material.dart';

class MovieDetailsConfig {
  const MovieDetailsConfig({
    required this.title,
  });

  final String title;
}

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key, required this.config});
  static const routeName = '/MovieDetailsPage';

  final MovieDetailsConfig config;

  @override
  State createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.config.title),
      ),
    );
  }
}
