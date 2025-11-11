import 'package:flutter/material.dart';
import 'package:smart_saloon/booking_page.dart';
import 'package:smart_saloon/favourites_page.dart';
import 'package:smart_saloon/profile_page.dart';
import 'package:smart_saloon/salon_details_page.dart';
import 'package:smart_saloon/sign_in_page.dart';

// --- MAIN WIDGET ---
// We use a StatefulWidget to manage the current selected tab index.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _SmartSalonHomePageState();
}

class _SmartSalonHomePageState extends State<HomePage> {
  // State for the selected tab in the Bottom Navigation Bar
  int _selectedIndex = 0;

  // List of all screens corresponding to the bottom navigation tabs
  static const List<Widget> _widgetOptions = <Widget>[
    // Index 0: Home (The original content)
    HomePageContent(),
    // Index 1: Bookings
    BookingsPage(),
    // Index 2: Favorites
    FavoritesPage(),
    // Index 3: Profile
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We set the background color to transparent here,
      // so the body's gradient can show through (for the home page only).
      backgroundColor: Colors.transparent,

      // The body now switches between the different pages/tabs
      body: _widgetOptions.elementAt(_selectedIndex),

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // --- BOTTOM NAVIGATION BAR IMPLEMENTATION ---
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      elevation: 10,
      selectedItemColor: const Color(0xFFC70039),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_rounded),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_rounded),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}

// --- HOMEPAGE CONTENT WIDGET (Contains the Scrollable Content) ---
class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  String _searchQuery = '';
  List<Salon> _allSalons = [];
  List<Salon> _filteredSalons = [];

  // Mock Data (now stored as Salon objects)
  final _mockSalonsData = [
    {
      'name': 'The Gentlemen’s Grooming Co.',
      'address': '789 Central Park West',
      'rating': 4.9,
      'imagePath': 'assets/picture/background_3.jpg',
      'distance': '1.2 km',
    },
    {
      'name': 'Luxe Nail & Spa Boutique',
      'address': '101 Broadway Ave, Suite 200',
      'rating': 4.7,
      'imagePath': 'assets/picture/background_4.jpg',
      'distance': '2.5 km',
    },
    {
      'name': 'Zen Hair & Color Studio',
      'address': '205 East 57th Street',
      'rating': 4.5,
      'imagePath': 'assets/picture/background_5.jpg',
      'distance': '0.8 km',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Initialize _allSalons and _filteredSalons on startup
    _allSalons = _mockSalonsData.map((data) {
      return Salon(
        name: data['name'] as String,
        address: data['address'] as String,
        rating: data['rating'] as double,
        imagePath: data['imagePath'] as String,
        distance: data['distance'] as String,
      );
    }).toList();
    _filteredSalons = _allSalons; // Initially show all salons
  }

  // --- FILTERING LOGIC ---
  void _filterSalons(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      if (_searchQuery.isEmpty) {
        _filteredSalons = _allSalons;
      } else {
        _filteredSalons = _allSalons.where((salon) {
          // Filter by salon name or address
          return salon.name.toLowerCase().contains(_searchQuery) ||
              salon.address.toLowerCase().contains(_searchQuery);
        }).toList();
      }
    });
  }

  // --- SIGN OUT LOGIC ---
  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              child:  Text('Cancel', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  color: Color.fromARGB(255, 253, 19, 19),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                //  Implement actual Firebase/Auth sign-out logic here
                Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (context)=>const SignInPage(),),
                );

                // Show a confirmation message (temporarily)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Signed out successfully!',
                    ),
                  ),
                );

                // In a real app, you would navigate to the Login/Splash screen here.
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Ensures the gradient container is visible
      appBar: _buildAppBar(context),
      body: Container(
        // Apply the gradient background here
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // A subtle shift from near-white to a very soft pink/gray
            colors: [
              Colors.white,
              const Color(0xFFFAE0E4), // A soft, welcoming color
              Colors.grey[100]!,
            ],
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          // Allows the content to scroll vertically
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 12.0),

              // --- SEARCH BAR SECTION ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: _buildSearchBar(),
              ),

              const SizedBox(height: 24.0),

              // --- CATEGORIES LIST SECTION ---
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Explore Services',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              _buildCategoriesList(),

              const SizedBox(height: 30.0),

              // --- FEATURED SALONS LIST SECTION ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Featured Salons Near You (${_filteredSalons.length} results)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              _buildFeaturedSalonsList(
                context,
              ), // Pass context to enable navigation

              const SizedBox(height: 20.0), // Extra space at the bottom
            ],
          ),
        ),
      ),
    );
  }

  // --- CUSTOM APP BAR IMPLEMENTATION ---
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    // Determine if the user is on the Profile tab (Index 3).
    // We only show the Sign Out button if they are on the Home tab (Index 0).
    // Note: The parent SmartSalonHomePage manages the index, but for simplicity
    // in HomePageContent, we'll assume we are signed in and need a sign-out mechanism
    // on the home view until we implement real authentication state.

    // Check if the user is currently "signed in" (mocked)
    const bool isSignedIn = true; // Assume user is signed in for now
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Current Location',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          Row(
            children: [
              Icon(Icons.location_on, size: 18, color: Color(0xFFC70039)),
              SizedBox(width: 4),
              Text(
                'New York, NY',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.black54),
            ],
          ),
        ],
      ),
      actions: [
        if (isSignedIn) // Only show sign out if user is "signed in"
          IconButton(
            onPressed: () {
              _showSignOutDialog(context); // Call the sign out dialog
            },
            icon: const CircleAvatar(
              backgroundColor: Colors.red, // Use a contrasting color for Sign Out
              child: Icon(Icons.logout, color: Colors.white, size: 20), // Logout icon
            ),
            tooltip: 'Sign Out',
          ),
        
        const SizedBox(width: 10),
      ],
    );
  }

  // --- SEARCH BAR IMPLEMENTATION ---
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: _filterSalons,
        decoration: InputDecoration(
          hintText: 'Search for salons or services...',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Color(0xFFC70039)),
          // Add a clear button if text is present
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _filterSalons('');
                  },
                  icon: Icon(Icons.clear, color: Colors.grey),
                )
              : null,
        ),
      ),
    );
  }

  // --- CATEGORIES LIST IMPLEMENTATION ---
  Widget _buildCategoriesList() {
    final categories = [
      {'name': 'Haircut', 'icon': Icons.content_cut},
      {'name': 'Manicure', 'icon': Icons.spa},
      {'name': 'Coloring', 'icon': Icons.brush},
      {'name': 'Massage', 'icon': Icons.self_improvement},
      {'name': 'Facials', 'icon': Icons.face_retouching_natural},
    ];

    return SizedBox(
      height: 100, // Fixed height for the horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            // Use margin to separate items and ensure edge padding
            margin: EdgeInsets.only(
              left: 20,
              right: index == categories.length - 1 ? 20 : 0,
            ),
            width: 80, // Fixed width for each category item
            child: Column(
              children: [
                // Icon container with shadow
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    category['icon'] as IconData,
                    color: const Color(0xFFC70039), // Accent color
                    size: 30,
                  ),
                ),
                const SizedBox(height: 8),
                // Category name text
                Text(
                  category['name'] as String,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // --- SALON CARD WIDGET (NAVIGATES TO DETAIL PAGE) ---
  Widget _buildSalonCard(BuildContext context, Salon salonData) {
    // -----------------------------------------------------------------
    // CRITICAL: The Salon object (salonData) must be defined here
    // so it is available to the onTap handlers below.
    // -----------------------------------------------------------------

    // final salonData = Salon(
    //   name: name,
    //   address: address,
    //   rating: rating,
    //   imagePath: imagePath,
    //   distance: distance,
    // );

    return InkWell(
      // Use InkWell for tap detection and visual ripple feedback
      onTap: () {
        // NAVIGATOR PUSH FOR CARD TAP
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SalonDetailPage(salon: salonData),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Asset Image Widget
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                salonData.imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                // Fallback for missing assets
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey[400],
                      ),
                    ),
                  );
                },
              ),
            ),

            // 2. Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Salon Name and Distance
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        salonData.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        salonData.distance,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Rating and Address
                  Row(
                    children: [
                      // Star Icon and Rating
                      Icon(
                        Icons.star_rounded,
                        color: Colors.amber[700],
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        salonData.rating.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' (150 reviews)',
                        style: TextStyle(color: Colors.grey[500], fontSize: 13),
                      ),
                      const Spacer(),

                      // Address
                      Icon(Icons.pin_drop, color: Colors.grey[500], size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          salonData.address,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Primary Action Button (Book Now)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // NAVIGATOR PUSH FOR BUTTON TAP (uses the defined salonData)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SalonDetailPage(salon: salonData),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFFC70039,
                        ), // Accent color
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- FEATURED SALONS LIST IMPLEMENTATION (Now uses filtered list) ---
  Widget _buildFeaturedSalonsList(BuildContext context) {
    if (_filteredSalons.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            'No salons found matching your search.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Map the filtered Salon objects to _buildSalonCard widgets
        children: _filteredSalons.map((salon) {
          return _buildSalonCard(
            context,
            salon, // Pass the already-created Salon object
          );
        }).toList(),
      ),
    );
  }

  //   // --- FEATURED SALONS LIST IMPLEMENTATION ---
  //   Widget _buildFeaturedSalonsList(BuildContext context) {
  //     // Mock Data for the list (will be replaced by database query later)
  //     final mockSalons = [
  //       {
  //         'name': 'The Gentlemen’s Grooming Co.',
  //         'address': '789 Central Park West',
  //         'rating': 4.9,
  //         'imagePath':
  //             'assets/picture/background_3.jpg', // Using the path you mentioned
  //         'distance': '1.2 km',
  //       },
  //       {
  //         'name': 'Luxe Nail & Spa Boutique',
  //         'address': '101 Broadway Ave, Suite 200',
  //         'rating': 4.7,
  //         'imagePath':
  //             'assets/picture/background_4.jpg', // Using the path you mentioned
  //         'distance': '2.5 km',
  //       },
  //       {
  //         'name': 'Zen Hair & Color Studio',
  //         'address': '205 East 57th Street',
  //         'rating': 4.5,
  //         'imagePath':
  //             'assets/picture/background_5.jpg', // Using the path you mentioned
  //         'distance': '0.8 km',
  //       },
  //     ];

  //     return Padding(
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: 20.0,
  //       ), // Apply horizontal padding here
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         // Map the mock data to _buildSalonCard widgets
  //         children: mockSalons.map((salon) {
  //           return _buildSalonCard(
  //             context, // Pass context here
  //             name: salon['name'] as String,
  //             address: salon['address'] as String,
  //             rating: salon['rating'] as double,
  //             imagePath: salon['imagePath'] as String,
  //             distance: salon['distance'] as String,
  //           );
  //         }).toList(),
  //       ),
  //     );
  //   }
}
