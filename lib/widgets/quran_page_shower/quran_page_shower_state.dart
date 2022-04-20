import 'package:dzikr/core/class/dzikr_state_class.dart';
import 'package:dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:dzikr/tools/quran_tool/quran_tool.dart';
import 'package:flutter/material.dart';

class QuranPageShowerState extends DzikrStateClass {
  // Data
  List<QuranPage> pages = [];
  int activeQuranPageIndex = 0;
  bool isUsingPageMode = true;
  bool isShowToolbar = true;

  // Tools
  var quranTools = QuranTool.init();

  // Controller
  PageController? quranPageController;
  PageController? quranIndicatorPageController;

  init(BuildContext context, {int? initialPage}) {
    quranTools.getLastOpenedPageIndex().then((value) {
      activeQuranPageIndex = value;
      activeQuranPageIndex = initialPage ?? activeQuranPageIndex;
      quranPageController = PageController(initialPage: activeQuranPageIndex);
      quranIndicatorPageController = PageController(
          viewportFraction: (0.45 / MediaQuery.of(context).size.width) * 100,
          initialPage: activeQuranPageIndex);
    });
  }

  setActiveQuranPageViaIndicator(int page) {
    quranPageController!.jumpToPage(page);
    notifyListeners();
  }

  setActiveQuranPageViaQuranPage(int page) {
    quranIndicatorPageController!.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
    activeQuranPageIndex = page;
    quranTools.setLastOpenedPageIndex(activeQuranPageIndex);
    notifyListeners();
  }

  toogleQuranMode() {
    isUsingPageMode = !isUsingPageMode;
    notifyListeners();
  }

  toogleIsShowToolbar() {
    isShowToolbar = !isShowToolbar;
    notifyListeners();
  }

  getQuranPage() async {
    pages = await quranTools.getQuranPages();
    notifyListeners();
  }
}
