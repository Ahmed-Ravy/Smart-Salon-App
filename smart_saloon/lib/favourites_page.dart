import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border_rounded, size: 80, color: Color(0xFFC70039)),
            SizedBox(height: 16),
            Text(
              'Your Favorite Salons',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Tap the heart icon on a salon to add it here!', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}