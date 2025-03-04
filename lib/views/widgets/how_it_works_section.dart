//! How it works section software deployment
import 'package:abhishekrexmedia/views/widgets/common.dart';
import 'package:flutter/material.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getPadding(context);

    return Container(
      padding: EdgeInsets.all(padding),
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            'How It Works',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Simple steps to get started with StudentsGigs',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),

          // Steps
          Wrap(
            spacing: 24,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _buildStep(
                context,
                '1',
                'Create an Account',
                'Sign up as a student or employer',
                Icons.person_add_alt,
                isMobile,
              ),
              _buildStep(
                context,
                '2',
                'Browse Opportunities',
                'Find gigs or talent that match your needs',
                Icons.search,
                isMobile,
              ),
              _buildStep(
                context,
                '3',
                'Connect & Collaborate',
                'Work together to achieve great results',
                Icons.handshake,
                isMobile,
              ),
            ],
          ),

          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
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
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildStep(
    BuildContext context,
    String number,
    String title,
    String description,
    IconData icon,
    bool isMobile,
  ) {
    final width = isMobile
        ? MediaQuery.of(context).size.width - 48
        : (MediaQuery.of(context).size.width - 144) / 3;

    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 32,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}