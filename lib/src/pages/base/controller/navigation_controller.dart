import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class NavigationTabs {
  static const int home = 0;
  static const int cart = 1;
  static const int orders = 2;
  static const int profile = 3;
}

class NavigationController extends GetxController {
  late PageController _pageController;

  late RxInt _currentIndex;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initNavigation(
      pageController: PageController(initialPage: NavigationTabs.home),
      initialPage: NavigationTabs.home,
    );
  }

  void _initNavigation(
      {required PageController pageController, required int initialPage}) {
    _pageController = pageController;
    _currentIndex = initialPage.obs;
  }

  void navigationPageview(int page) {
    if (page == _currentIndex.value) return;
    _currentIndex.value = page;
    _pageController.jumpToPage(page);
  }
}
