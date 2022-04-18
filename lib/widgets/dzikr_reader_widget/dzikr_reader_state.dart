import 'package:dzikr/core/class/dzikr_state_class.dart';
import 'package:flutter/material.dart';

class DzikrReaderState extends DzikrStateClass {
  DzikrReaderState({required this.dataLength});
  int dataLength;
  int currentCollectionIndex = 0;
  PageController pageController = PageController();

  nextIndex() {
    if (currentCollectionIndex + 1 < dataLength) {
      currentCollectionIndex = currentCollectionIndex + 1;
      pageController.animateToPage(currentCollectionIndex,
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    }
    notifyListeners();
  }

  prevIndex() {
    if (currentCollectionIndex - 1 >= 0) {
      currentCollectionIndex = currentCollectionIndex - 1;
      pageController.animateToPage(currentCollectionIndex,
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    }
    notifyListeners();
  }

  setCollectionIndex(int index) {
    currentCollectionIndex = index;
    notifyListeners();
  }
}
