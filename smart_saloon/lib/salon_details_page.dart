import 'package:flutter/material.dart';

// This is the model/data structure for a single salon
class Salon {
  final String name;
  final String address;
  final double rating;
  final String imagePath;
  final String distance;

  Salon({
    required this.name,
    required this.address,
    required this.rating,
    required this.imagePath,
    required this.distance,
  });
}

class SalonDetailPage extends StatelessWidget {
  final Salon salon;
  
  const SalonDetailPage({super.key, required this.salon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 1. App Bar / Hero Image Section (SliverAppBar)
          SliverAppBar(
            expandedHeight: 280.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                salon.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                ),
              ),
              background: _buildHeroImage(),
            ),
            backgroundColor: const Color(0xFFC70039),
          ),
          
          // 2. Main Content
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Rating and Location Bar ---
                      _buildInfoBar(),
                      const Divider(height: 30),

                      // --- About Section ---
                      _buildSectionTitle('About the Salon'),
                      const SizedBox(height: 8),
                      const Text(
                        'This luxury spot offers a full range of premium services, specializing in modern coloring techniques and precise gentleman\'s cuts. Our environment is designed for ultimate relaxation and pampering.',
                        style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                      ),
                      const SizedBox(height: 20),

                      // --- Services & Pricing Section ---
                      _buildSectionTitle('Services & Pricing'),
                      _buildServiceList(),
                      const SizedBox(height: 20),
                      
                      // --- Review Summary ---
                      _buildSectionTitle('Customer Reviews'),
                      _buildReviewSummary(),
                      
                      const SizedBox(height: 30),
                      
                      // --- Primary Action Button ---
                      _buildBookingButton(context),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildHeroImage() {
    return Image.asset(
      salon.imagePath,
      width: double.infinity,
      fit: BoxFit.cover,
      // Robust Fallback for missing assets
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: double.infinity,
          color: const Color(0xFFC70039).withOpacity(0.1),
          child: const Center(
            child: Icon(
              Icons.image_not_supported,
              size: 70,
              color: Color(0xFFC70039),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFC70039)),
    );
  }

  Widget _buildInfoBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.star_rounded, color: Colors.amber[700], size: 24),
            const SizedBox(width: 4),
            Text(
              '${salon.rating} • ${salon.distance} away',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            // TODO: Implement toggle favorite
          },
          icon: const Icon(Icons.favorite_border_rounded, color: Color(0xFFC70039), size: 28),
        ),
      ],
    );
  }

  Widget _buildServiceList() {
    final services = [
      {'name': 'Classic Haircut', 'price': '\$45', 'duration': '45 min'},
      {'name': 'Full Color & Style', 'price': '\$120', 'duration': '90 min'},
      {'name': 'Deluxe Manicure', 'price': '\$60', 'duration': '60 min'},
      {'name': 'Deep Tissue Massage', 'price': '\$95', 'duration': '60 min'},
    ];

    return Column(
      children: services.map((service) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service['name']!,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    service['duration']!,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              Text(
                service['price']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildReviewSummary() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${salon.rating} / 5.0',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFC70039)),
              ),
              Text('Based on 150 reviews', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          TextButton.icon(
            onPressed: () {
              // TODO: Navigate to full reviews page
            },
            icon: const Icon(Icons.arrow_forward_ios, size: 16),
            label: const Text('View All'),
            style: TextButton.styleFrom(foregroundColor: const Color(0xFFC70039)),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Start the actual booking flow
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Starting the booking process!')),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC70039), // Accent color
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
        ),
        child: const Text(
          'Proceed to Booking',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}