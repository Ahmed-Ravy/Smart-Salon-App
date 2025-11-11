import 'package:flutter/material.dart';

class HomePageOld extends StatefulWidget {
  const HomePageOld({super.key});

  @override
  State<HomePageOld> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageOld> {
  //State fot the selected tab in the Bottom Navigation Bar
  int _selectedIndex = 0;

  //   // List of all screens corresponding to the bottom navigation tabs
  // static const List<Widget> _widgetOptions = <Widget>[
  //   // Index 0: Home (The original content)
  //   HomePageContent(),
  //   // Index 1: Bookings
  //   BookingsPage(),
  //   // Index 2: Favorites
  //   FavoritesPage(),
  //   // Index 3: Profile
  //   ProfilePage(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, //Transparent background for the body,So that the body's gradient can show through

      appBar: _buildAppBar(context), //Full code of appbar is at the bottom

      body: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
                Colors.white,
                const Color.fromARGB(170, 7, 103, 199),
                Colors.grey[100]!,
            ],
            //stops: const [0.0,0.4,1.0],
            ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 12),
        
              //Search Bar Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _buildSearchBar(),
              ), //Search Bar done...Full code is at the bottom
        
              const SizedBox(height: 16),
        
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 18),
              //   child: Text("Select a Category for more details",
              //     style: TextStyle(
              //       fontSize: 14,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              //Categories text Section
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Explore Services',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              //Categories text Done
              const SizedBox(height: 24),
              _buildCategoriesList(), //Category List Built at the bottom
        
              const SizedBox(height: 30),
        
              //Featured Salons List Text Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Featured Salons Near You",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
        
              //Featured Salons List  Section
              const SizedBox(height: 16),
               _buildFeaturedSalonsList(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  //Custom App Bar Implementation
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      //Title Section  (Location)
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Current Location",
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),

          //Dynamic Location Row
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 18,
                color: Color.fromARGB(255, 220, 6, 67),
              ),
              SizedBox(width: 4),

              //Location Text
              Text(
                'Dhaka,Bangladesh',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              //Dropdown Arrow Icon
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 18,
                color: Colors.black54,
              ),
            ],
          ),
        ],
      ),

      //Action Section
      actions: [
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor: Color(0xFFC70039),
            child: Icon(Icons.person, color: Colors.white, size: 28),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  //Search Bar Implementation

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for salons or services...",
          hintStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Color(0xFFC70039)),
        ),
      ),
    );
  }

  Widget _buildCategoriesList() {
    final List<Map<String, dynamic>> categories = [
      {'name': 'Haircut', 'icon': Icons.content_cut_outlined},
      {'name': 'Manicure', 'icon': Icons.spa_sharp},
      {'name': 'Hair Color', 'icon': Icons.brush_sharp},
      {'name': 'Massage', 'icon': Icons.self_improvement},
      {'name': 'Facials', 'icon': Icons.face_retouching_natural},
    ];

    return SizedBox(
      height: 100, //fixed height for each box
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            //margin is used to separate items and ensure edge padding
            margin: EdgeInsets.only(
              left: 20,
              right: index == categories.length - 1 ? 20 : 0,
            ),
            width: 80, //fixed width for each item
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4,
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

                //category name text
                Text(
                  category['name'] as String,
                  style:const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color:  Colors.white,
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

  Widget _buildSalonCard({
    required String name,
    required String address,
    required double rating,
    required String imagePath,
    required String distance,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image placeHolder
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
            ),
          ),

          //Details Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Salon Name and Distance
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      distance,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                //Rating and Address
                Row(
                  children: [
                    //Star Icon and Rating
                    Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' (150 reviews)',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const Spacer(),

                    //Address
                    Icon(Icons.pin_drop, color: Colors.grey, size: 16),
                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        address,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                //Primary Action Button (Book Now)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                       // Navigate to the detail page when 'Book Now' is pressed 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC70039), // Accent color
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Book Now",
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
    );
  }

  Widget _buildFeaturedSalonsList() {
    final mockSalons = [
      {
        'name': 'The Gentlemen’s Grooming Co.',
        'address': '789 Central Park West',
        'rating': 4.9,
        'imagePath': 'assets/picture/background_3.jpg',
        'distance': '1.2 km',
      },
      {
        'name': 'Bikrom Nail & Spa Boutique',
        'address': '101 Broadway Ave, Suite 200',
        'rating': 4.7,
        'imagePath': 'assets/picture/background_4.jpg',
        'distance': '2.5 km',
      },
      {
        'name': 'Ravy Hair & Color Studio',
        'address': '205 East 57th Street',
        'rating': 4.5,
        'imagePath': 'assets/picture/background_5.jpg',
        'distance': '0.8 km',
      },
      {
        'name': 'Rion Hair & Color Studio',
        'address': '205 East 57th Street',
        'rating': 4.5,
        'imagePath': 'assets/picture/background_6.jpg',
        'distance': '0.8 km',
      },
      {
        'name': 'Rafiul Hair & Color Studio',
        'address': '205 East 57th Street',
        'rating': 4.5,
        'imagePath': 'assets/picture/background_7.jpg',
        'distance': '0.8 km',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //Map The demo data to _buildSalonCard widgets
        children: mockSalons.map((salon) {
          return _buildSalonCard(
            name: salon['name'] as String,
            address: salon['address'] as String,
            rating: salon['rating'] as double,
            imagePath: salon['imagePath'] as String,
            distance: salon['distance'] as String,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      elevation: 10,
      selectedItemColor: Colors.blueAccent,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_rounded),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_rounded),
          label: 'Favourites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
