import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StyleNest',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
        textTheme: GoogleFonts.cormorantTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // For now, just print the tapped item
    print("Tapped on index: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        backgroundColor: const Color(0xFFB7AEB2),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location and lock icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_pin, size: 20),
                      const SizedBox(width: 4),
                      Text('Kathmandu, Lalitpur',
                          style: GoogleFonts.cormorant(
                              fontStyle: FontStyle.italic, fontSize: 16)),
                    ],
                  ),
                  const Icon(Icons.lock_outline),
                ],
              ),
              const SizedBox(height: 20),

              // Search Bar
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDEBFB),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 28),
                    const SizedBox(width: 8),
                    Text('Search',
                        style: GoogleFonts.cormorant(
                            fontSize: 18, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 160,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: [
                  'https://via.placeholder.com/300x150.png?text=Coming+Soon',
                  'https://via.placeholder.com/300x150.png?text=New+Arrivals',
                  'https://via.placeholder.com/300x150.png?text=Trending+Now',
                ].map((url) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              Text('Category',
                  style: GoogleFonts.cormorant(
                      fontSize: 20, fontStyle: FontStyle.italic)),
              const SizedBox(height: 10),

              // Category Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCategoryIcon(Icons.checkroom, 'Dresses'),
                  buildCategoryIcon(Icons.emoji_people, 'T-Shirts'),
                  buildCategoryIcon(Icons.work, 'Pants'),
                ],
              ),
              const SizedBox(height: 20),

              // Gender Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildGenderButton('Men'),
                  buildGenderButton('Women'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryIcon(IconData icon, String label) {
    return InkWell(
      onTap: () => print('$label tapped'),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 35,
            child: Icon(icon, size: 30, color: Colors.black),
          ),
          const SizedBox(height: 6),
          Text(label,
              style: GoogleFonts.cormorant(
                  fontStyle: FontStyle.italic, fontSize: 16)),
        ],
      ),
    );
  }

  Widget buildGenderButton(String label) {
    return InkWell(
      onTap: () => print('$label selected'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFDF1F0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(label,
            style: GoogleFonts.cormorant(
                fontStyle: FontStyle.italic, fontSize: 16)),
      ),
    );
  }
}
