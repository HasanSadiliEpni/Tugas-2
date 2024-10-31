import 'package:flutter/material.dart';

class LatestComicCard extends StatelessWidget {
  final String title;
  final String chapter;
  final String imagePath;

  LatestComicCard({
    required this.title,
    required this.chapter,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Tentukan warna latar belakang dan warna teks berdasarkan tema
    final cardColor = Theme.of(context).brightness == Brightness.light
        ? Colors.grey[300] // Warna card pada mode terang
        : Colors.grey[900]; // Warna card pada mode gelap

    final textColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black87 // Warna teks di mode terang
        : Colors.white; // Warna teks di mode gelap

    final subtitleColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black54 // Warna subtitle teks di mode terang
        : Colors.grey[400]; // Warna subtitle teks di mode gelap

    return Card(
      color: cardColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor, // Menggunakan warna teks utama sesuai tema
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              chapter,
              style: TextStyle(color: subtitleColor), // Warna subtitle sesuai tema
            ),
          ],
        ),
      ),
    );
  }
}
