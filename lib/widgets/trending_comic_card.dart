import 'package:flutter/material.dart';

class TrendingComicCard extends StatelessWidget {
  final String title;
  final double rating;
  final int views;

  const TrendingComicCard({
    required this.title,
    required this.rating,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    // Tentukan warna teks berdasarkan tema
    final textColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black87 // Warna teks di mode terang
        : Colors.white54; // Warna teks di mode gelap

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.amber, size: 16),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: textColor), // Mengatur warna teks sesuai tema
            ),
          ),
          Text(
            "$rating ★",
            style: TextStyle(color: textColor), // Mengatur warna teks sesuai tema
          ),
          SizedBox(width: 5),
          Text(
            "$views views",
            style: TextStyle(color: textColor), // Mengatur warna teks sesuai tema
          ),
        ],
      ),
    );
  }
}
