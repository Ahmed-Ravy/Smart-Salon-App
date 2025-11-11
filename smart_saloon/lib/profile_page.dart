import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_outline_rounded, size: 80, color: Color(0xFFC70039)),
            SizedBox(height: 16),
            Text(
              'Your Profile & Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Manage your account, history, and preferences.', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}