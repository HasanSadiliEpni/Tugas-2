import 'package:flutter/material.dart';
import '../widgets/latest_comic_card.dart';
import '../widgets/trending_comic_card.dart';

class ComicHomePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  ComicHomePage({required this.isDarkMode, required this.onThemeChanged});

  @override
  _ComicHomePageState createState() => _ComicHomePageState();
}

class _ComicHomePageState extends State<ComicHomePage> {
  // Variabel untuk melacak filter yang dipilih
  String _selectedFilter = "Harian";

  // Daftar komik terbaru
  final List<Map<String, String>> comics = [
    {
      "title": "Comic 1",
      "chapter": "Chapter 123",
      "imagePath": "images/comic1.jpeg",
    },
    {
      "title": "Comic 2",
      "chapter": "Chapter 123",
      "imagePath": "images/comic2.jpeg",
    },
    {
      "title": "Comic 3",
      "chapter": "Chapter 123",
      "imagePath": "images/comic3.jpeg",
    },
        {
      "title": "Comic 4",
      "chapter": "Chapter 123",
      "imagePath": "images/comic4.jpeg",
    },

  ];

  // Daftar komik trending
  final List<Map<String, dynamic>> trendingComics = [
    {
      "title": "Comic 1",
      "rating": 4.9,
      "views": 12345,
    },
    {
      "title": "Comic 2",
      "rating": 4.8,
      "views": 12345,
    },
    {
      "title": "Comic 3",
      "rating": 4.7,
      "views": 12345,
    },
    {
      "title": "Comic 4",
      "rating": 4.6,
      "views": 12345,
    },
    {
      "title": "Comic 5",
      "rating": 4.5,
      "views": 12345,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black87
        : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: Text("Komiku"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          Switch(
            value: widget.isDarkMode,
            onChanged: widget.onThemeChanged,
            activeColor: Colors.white,
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 600;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bagian Komik Terbaru
                  Text(
                    "Daftar Komik",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isWideScreen ? 3 : 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: comics.length,
                    itemBuilder: (context, index) {
                      final comic = comics[index];
                      return LatestComicCard(
                        title: comic["title"]!,
                        chapter: comic["chapter"]!,
                        imagePath: comic["imagePath"]!,
                      );
                    },
                  ),
                  SizedBox(height: 20),

                  // Bagian Trending Komik
                  Text(
                    "Trending",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      _buildFilterButton("Harian"),
                      _buildFilterButton("Mingguan"),
                      _buildFilterButton("Semua"),
                    ],
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: trendingComics.length,
                    itemBuilder: (context, index) {
                      final trendingComic = trendingComics[index];
                      return TrendingComicCard(
                        title: trendingComic["title"],
                        rating: trendingComic["rating"],
                        views: trendingComic["views"],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget untuk membuat tombol filter
  Widget _buildFilterButton(String filter) {
    final isSelected = _selectedFilter == filter;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = filter;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          filter,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
