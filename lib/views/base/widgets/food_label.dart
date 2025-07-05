
// Updated FoodLabel widget
import 'package:flutter/material.dart';

class FoodLabel extends StatelessWidget {
  final double size;
  final String label;
  final String iconPath;
  final VoidCallback onTap;
  final bool isSelected;

  const FoodLabel({
    super.key,
    this.size = 60,
    required this.label,
    required this.iconPath,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            width: isSelected ? size + 10 : size,
            height: isSelected ? size + 10 : size,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ClipOval(child: Image.asset(iconPath, fit: BoxFit.cover)),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}