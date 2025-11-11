import 'package:flutter/material.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today_rounded, size: 80, color: Color(0xFFC70039)),
            SizedBox(height: 16),
            Text(
              'Your Upcoming Appointments',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('No bookings found. Time to pamper yourself!', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}