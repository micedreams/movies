import 'package:flutter/material.dart';
import 'home_page.dart';
import 'movie_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        brightness: Brightness.dark,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Top Movies'),
      onGenerateRoute: (settings) {
        if (MovieDetailsPage.routeName == settings.name) {
          final config = settings.arguments as MovieDetailsConfig;
          return MaterialPageRoute(
              builder: (_) => MovieDetailsPage(config: config));
        }
        return null;
      },
    );
  }
}
