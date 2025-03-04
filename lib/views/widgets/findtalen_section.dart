import 'package:abhishekrexmedia/views/widgets/common.dart';
import 'package:flutter/material.dart';

//! After the home screen section

class FindTalentsSection extends StatelessWidget {
  const FindTalentsSection({Key? key}) : super(key: key);

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
            'Find Student Talents',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Connect with skilled students ready to work on your projects',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Skills grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 4,
              childAspectRatio: 1.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              final categories = [
                'Design',
                'Development',
                'Marketing',
                'Writing',
                'Video',
                'Music',
                'Business',
                'Lifestyle'
              ];
              final icons = [
                Icons.design_services,
                Icons.code,
                Icons.trending_up,
                Icons.edit,
                Icons.videocam,
                Icons.music_note,
                Icons.business,
                Icons.psychology
              ];

              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index],
                      size: 32,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      categories[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 32),
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
              'Find Student Talents',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
