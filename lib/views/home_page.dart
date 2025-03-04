
import 'package:abhishekrexmedia/modals/carousel_item.dart';
import 'package:abhishekrexmedia/views/widgets/common.dart';
import 'package:abhishekrexmedia/views/explore_gigs.dart';
import 'package:abhishekrexmedia/views/footer_section.dart';
import 'package:abhishekrexmedia/views/widgets/explore_gigs.dart';
import 'package:abhishekrexmedia/views/widgets/findtalen_section.dart';
import 'package:abhishekrexmedia/views/widgets/how_it_works_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:async';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double getPadding(BuildContext context) {
    if (isMobile(context)) return 16.0;
    if (isTablet(context)) return 32.0;
    return 64.0;
  }
}


//! CarouselController
class CarouselController extends ChangeNotifier {
  int _currentIndex = 0;
  final List<CarouselItem> _items = [
    CarouselItem(
      imagePath: AppAssets.backgroundImage1,
      title: 'Hire Student Talent',
      subtitle: 'Connect with skilled students ready to contribute',
    ),
    CarouselItem(
      imagePath: AppAssets.backgroundImage2,
      title: 'Find Perfect Gigs',
      subtitle: 'Discover opportunities that match your skills',
    ),
    CarouselItem(
      imagePath: AppAssets.backgroundImage3,
      title: 'Build Your Portfolio',
      subtitle: 'Gain experience and grow your professional network',
    ),
  ];

  int get currentIndex => _currentIndex;
  List<CarouselItem> get items => _items;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void nextSlide() {
    _currentIndex = (_currentIndex + 1) % _items.length;
    notifyListeners();
  }
}

//! HomePage
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _carouselController = CarouselController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Auto-rotate carousel every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _carouselController.nextSlide();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                // SliverAppBar as header
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  expandedHeight: 0,
                  flexibleSpace: const AppHeader(),
                ),

                // Main content sections
                SliverList(
                  delegate: SliverChildListDelegate([
                    // Carousel Banner Section
                    CarouselSection(controller: _carouselController),

                    // Other content sections
                    const FindTalentsSection(),
                    const ExploreGigsSection(),
                    const HowItWorksSection(),
                    // const PopularGigsSection(),
                    // const TestimonialsSection(),
                    // const StatsSection(),
                    // const NewsletterSection(),

                    // // Footer
                    StudentsGigsFooter(),
                  ]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getPadding(context),
        vertical: 8,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Image.asset(
                'asset/colorful-swirl-logo-design-concept-illustration-vector-removebg-preview.png', // Make sure to add this image to your assets
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 8),
              RichText(
                text:  TextSpan(
                  children: [
                    TextSpan(
                      text: "Students",
                      style: GoogleFonts.aBeeZee(  fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2A8BC6), // Blue color from image
                        height: 0.9,)
                    ),
                    TextSpan(
                      text: "\nGigs",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE78D2C), // Orange color from image
                        height: 0.9,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Search Bar
          if (!isMobile)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Search...',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Mobile search icon
          if (isMobile)
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.search),
            ),

          // Menu
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }
}

//! Carousel

class CarouselSection extends StatelessWidget {
  final CarouselController controller;

  const CarouselSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final currentItem = controller.items[controller.currentIndex];

        return Container(
          height: 600,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(currentItem.imagePath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.darken,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(ResponsiveHelper.getPadding(context)),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.book, color: Colors.white),
                              Text('Find Student Talents',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExploreGigs())),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF004672),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.explore,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Explore Gigs',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                // Title
                Text(
                  currentItem.title,
                  style:  GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                //  title
                Text(
                  currentItem.subtitle,
                  style:  GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 32),

                // CTA Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child:  Text(
                    'Explore',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                const SizedBox(height: 32),

                // Carousel indicators
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    controller.items.length,
                    (index) => GestureDetector(
                      onTap: () => controller.setIndex(index),
                      child: Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentIndex == index
                              ? AppColors.primary
                              : Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}






