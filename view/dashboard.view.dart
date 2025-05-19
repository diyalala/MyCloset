import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle categoryTextStyle = GoogleFonts.cormorant(
      fontSize: 16,
      fontStyle: FontStyle.italic,
    );

    return Scaffold(
      
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        backgroundColor: const Color(0xFFB7AEB2),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
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
                    Text(
                      'Kathmandu, Lalitpur',
                      style: GoogleFonts.cormorant(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
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
                  Text(
                    'Search',
                    style: GoogleFonts.cormorant(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // // Carousel Slider
            // cs.CarouselSlider(
            //   options: cs.CarouselOptions(
            //     height: 160,
            //     enlargeCenterPage: true,
            //     autoPlay: true,
            //     autoPlayInterval: const Duration(seconds: 3),
            //   ),
            //   items: [
            //     'https://via.placeholder.com/300x150.png?text=Coming+Soon',
            //     'https://via.placeholder.com/300x150.png?text=New+Arrivals',
            //     'https://via.placeholder.com/300x150.png?text=Trending+Now',
            //   ].map((url) {
            //     return ClipRRect(
            //       borderRadius: BorderRadius.circular(30),
            //       child: Image.network(
            //         url,
            //         fit: BoxFit.cover,
            //         width: double.infinity,
            //       ),
            //     );
            //   }).toList(),
            // ),
            // const SizedBox(height: 20),

            // Category Label
            Text('Category', style: categoryTextStyle),
            const SizedBox(height: 10),

            // Category Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryIcon(Icons.close, 'Dresses'),
                categoryIcon(Icons.emoji_people, 'T-Shirts'),
                categoryIcon(Icons.work, 'Pants'),
              ],
            ),
            const SizedBox(height: 20),

            // Gender Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                genderButton('Man'),
                genderButton('Women'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          radius: 35,
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.cormorant(
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget genderButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1F0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: GoogleFonts.cormorant(
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
      ),
    );
  }
}
