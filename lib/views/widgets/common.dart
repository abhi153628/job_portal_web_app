import 'package:abhishekrexmedia/modals/carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// File: utils/responsive_helper.dart
// -----------------------------------
import 'package:flutter/material.dart';


class AppColors {
  static const Color primary = Color(0xFFFF8022);
  static const Color secondary = Color(0xFF005580);
  static const Color background = Colors.white;
  static const Color darkBackground = Color(0xFF12202E);
  static const Color textDark = Color(0xFF333333);
  static const Color textLight = Colors.white;
}

class AppAssets {
  static const String logo = 'asset/colorful-swirl-logo-design-concept-illustration-vector-removebg-preview.png';
  static const String backgroundImage1 = 'asset/istockphoto-1072191720-612x612.jpg';
  static const String backgroundImage2 = 'asset/istockphoto-1470544060-612x612.jpg';
  static const String backgroundImage3 = 'asset/vibrant-vertical-portrait-male-teacher-600nw-2154311867.webp';
}



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

// File: controllers/carousel_controller.dart
// -----------------------------------


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