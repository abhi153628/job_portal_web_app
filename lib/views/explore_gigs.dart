import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static double getContainerWidth(BuildContext context) {
    if (isMobile(context)) return MediaQuery.of(context).size.width * 0.9;
    if (isTablet(context)) return 600;
    return 800; // desktop
  }
}

class ExploreGigs extends StatelessWidget {
  const ExploreGigs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Action Buttons Row (Find Student Talents & Explore Gigs)
            Container(
              color: const Color(0xFF2A7D62), // Green background
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Find Student Talents Button
                
                ],
              ),
            ),

            // Hero Section with Inspirational Text and Background Image
            Stack(
              alignment: Alignment.center,
              children: [
                // Background Image with Overlay
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/students_background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.5), // Dark overlay
                  ),
                ),
                
                // Inspirational Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    '"Your profile is your gateway to independence and practical learning. Build it to showcase your skills, explore opportunities, and prepare for the challenges of tomorrow."',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: ResponsiveHelper.isMobile(context) ? 20 : 24,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),

            // Search Filters Container
            Transform.translate(
              offset: const Offset(0, -40), // Move up to overlap hero section
              child: Container(
                width: ResponsiveHelper.getContainerWidth(context),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Category Dropdown
                      _buildFilterField(
                        icon: Icons.category,
                        iconColor: Colors.teal,
                        hintText: 'Select a Category....',
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // City Search Field
                      _buildFilterField(
                        icon: Icons.location_on,
                        iconColor: Colors.teal,
                        hintText: 'Search a City....',
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Salary Type Dropdown
                      _buildFilterField(
                        icon: Icons.calendar_today,
                        iconColor: Colors.teal,
                        hintText: 'Select Your Salary Type...',
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Search Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.search, color: Colors.white),
                          label: const Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00BF7E), // Green
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Add some space at the bottom
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterField({
    required IconData icon,
    required Color iconColor,
    required String hintText,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(icon, color: iconColor),
          ),
          // Text
          Expanded(
            child: Text(
              hintText,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ),
          // Dropdown arrow
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}