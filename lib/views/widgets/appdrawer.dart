import 'package:flutter/material.dart';
//! drawer to implement
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo in drawer
                Row(
                  children: [
                    Image.asset(
                      'asset/colorful-swirl-logo-design-concept-illustration-vector-removebg-preview.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 8),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Students",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2A8BC6), // Blue color
                              height: 0.9,
                            ),
                          ),
                          TextSpan(
                            text: "\nGigs",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE78D2C), // Orange color
                              height: 0.9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Close button
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          
          const Divider(),
          
          // Menu Title
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          const Divider(),
          
          // Menu Items
          _buildDrawerItem(
            context,
            icon: Icons.campaign,
            text: "Search Gig Jobs",
            onTap: () {
              // Navigation logic here
              Navigator.pop(context);
            },
          ),
          
          const Divider(),
          
          _buildDrawerItem(
            context,
            icon: Icons.school,
            text: "Find Student Talents",
            onTap: () {
              // Navigation logic here
              Navigator.pop(context);
            },
          ),
          
          const Divider(),
          
          _buildDrawerItem(
            context,
            icon: Icons.contact_page,
            text: "Contact",
            onTap: () {
              // Navigation logic here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 24),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}