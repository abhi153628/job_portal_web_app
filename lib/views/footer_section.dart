import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentsGigsFooter extends StatelessWidget {
  const StudentsGigsFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F1924), // Dark navy background
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;
          
          return Column(
            crossAxisAlignment: isSmallScreen 
                ? CrossAxisAlignment.center 
                : CrossAxisAlignment.start,
            children: [
              // Address Section
              _buildAddressSection(isSmallScreen),
              
              const SizedBox(height: 40),
              
              // Connect with Us Section
              _buildConnectSection(isSmallScreen),
              
              const SizedBox(height: 40),
              
              // Newsletter Section
              _buildNewsletterSection(isSmallScreen),
              
              const SizedBox(height: 24),
              
              // Get Started Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2ED573), // Green button
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              const Divider(color: Color(0xFF2D3A4A)),
              
              const SizedBox(height: 24),
              
              // Copyright and policies
              _buildCopyrightSection(isSmallScreen),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAddressSection(bool isSmallScreen) {
    final textAlign = isSmallScreen ? TextAlign.center : TextAlign.start;
    
    return Column(
      crossAxisAlignment: isSmallScreen 
          ? CrossAxisAlignment.center 
          : CrossAxisAlignment.start,
      children: [
        Text(
          'Our Address',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 16),
        Text(
          'StudentsGigs is an initiative of Medresearch India Pvt. Ltd.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 16),
        Text(
          'Medresearch India Pvt. Ltd.\nRKP/569H, Usha Building, Parammal Road\nRamanattukara, Kozhikode, Kerala, India. PIN 673633',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1.5,
          ),
          textAlign: textAlign,
        ),
        const SizedBox(height: 16),
        
        // Contact info
        InkWell(
          onTap: () => Text('tel:+919072399100'),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.phone,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                '+91 90723 99100',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () => Text('mailto:studentsgigs@gmail.com'),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Center(
                  child: Icon(
                    Icons.mail,
                    color: Color(0xFF0F1924),
                    size: 12,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'studentsgigs@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConnectSection(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: isSmallScreen 
          ? CrossAxisAlignment.center 
          : CrossAxisAlignment.start,
      children: [
        Text(
          'Connect With Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: isSmallScreen 
              ? MainAxisAlignment.center 
              : MainAxisAlignment.start,
          children: [
            _socialIcon(FontAwesomeIcons.facebook, 'https://facebook.com'),
            _socialIcon(FontAwesomeIcons.instagram, 'https://instagram.com'),
            _socialIcon(FontAwesomeIcons.threads, 'https://threads.net'),
            _socialIcon(FontAwesomeIcons.twitter, 'https://twitter.com'),
            _socialIcon(FontAwesomeIcons.linkedin, 'https://linkedin.com'),
            _socialIcon(FontAwesomeIcons.pinterest, 'https://pinterest.com'),
          ],
        ),
      ],
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () => Text('mailto:studentsgigs@gmail.com'),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: Center(
            child: FaIcon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
//! News letter 
  Widget _buildNewsletterSection(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: isSmallScreen 
          ? CrossAxisAlignment.center 
          : CrossAxisAlignment.start,
      children: [
        Text(
          'Subscribe to our Newsletter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Your email',
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                  topRight: Radius.circular(isSmallScreen ? 4 : 0),
                  bottomRight: Radius.circular(isSmallScreen ? 4 : 0),
                ),
                borderSide: BorderSide.none,
              ),
              suffixIcon: isSmallScreen 
                  ? null 
                  : Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF4285F4),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          minimumSize: const Size(120, 48),
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Subscribe',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
        if (isSmallScreen) ...[
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4285F4),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              'Subscribe',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white
              ),
            ),
          ),
        ],
      ],
    );
  }
//! Bottom most space
  Widget _buildCopyrightSection(bool isSmallScreen) {
    final TextStyle policyStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
      decoration: TextDecoration.underline,
    );

    return Column(
      children: [
        Text(
          '© 2025 Job Portal. All Rights Reserved.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            InkWell(
              onTap: () {},
              child: Text('Privacy Policy', style: policyStyle),
            ),
            InkWell(
              onTap: () {},
              child: Text('Terms & Conditions', style: policyStyle),
            ),
            InkWell(
              onTap: () {},
              child: Text('Refund Policy', style: policyStyle),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Powered by Exmedia',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Future<void> _launchUrl(String urlString) async {
  //   final Uri url = Uri.parse(urlString);
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }
}