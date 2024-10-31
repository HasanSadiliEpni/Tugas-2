import 'package:flutter/material.dart';
import 'pages/comic_home_page.dart';
import 'themes/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? darkTheme : lightTheme,
      home: ComicHomePage(
        isDarkMode: isDarkMode,
        onThemeChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
