import 'package:flutter/material.dart';

class TrendingFilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TrendingFilterButton({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey[800],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 12),
        ),
        child: Text(label),
      ),
    );
  }
}
