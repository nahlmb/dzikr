import 'package:auto_size_text/auto_size_text.dart';
import 'package:dzikr/core/config/size_config.dart';
import 'package:dzikr/data/quran_data/quran_data_model/quran_chapter.dart';
import 'package:dzikr/data/quran_data/quran_data_model/quran_page_response.dart';
import 'package:dzikr/data/quran_data/quran_data_model/quran_page.dart';
import 'package:dzikr/data/quran_data/quran_data_model/quran_page_reader_config.dart';
import 'package:dzikr/tools/quran_tool/quran_tool.dart';
import 'package:dzikr/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:dzikr/widgets/quran_page_reader_widget/quran_page_reader_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Widget that instanly process Quran data from QuranTool and show it to user
///
/// Use [QuranPageReaderConfig] for configuring style of Reader
///
/// [QuranPageReader] is part of Dzikr Package
class QuranPageReader extends StatelessWidget {
  const QuranPageReader(
      {Key? key,
      required this.config,
      this.appBar,
      this.onPageChange,
      this.initialPage})
      : super(key: key);
  final QuranPageReaderConfig config;
  final int? initialPage;
  final PreferredSizeWidget? appBar;
  final Function(int page)? onPageChange;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuranPageReaderState>(
        create: (context) => QuranPageReaderState(),
        builder: (context, child) {
          // Start state
          QuranPageReaderState state =
              Provider.of<QuranPageReaderState>(context, listen: false);

          // Setup
          state.init(context, initialPage: initialPage);
          state.getQuranPage();

          return Consumer<QuranPageReaderState>(
              builder: (context, state, child) {
            return Scaffold(
              backgroundColor: config.backgroundColor,
              appBar: state.isShowToolbar ? appBar : null,
              bottomNavigationBar: state.quranPageController == null ||
                      state.quranIndicatorPageController == null
                  ? null
                  : Visibility(
                      maintainState: true,
                      maintainAnimation: true,
                      maintainSize: false,
                      visible:
                          state.isShowToolbar && config.isUsingBottomIndicator,
                      child: Container(
                          color: config.primaryColor,
                          child: SafeArea(
                              child: SizedBox(
                            height: 64,
                            child: PageView(
                                pageSnapping: true,
                                reverse: true,
                                onPageChanged: (page) {
                                  state.setActiveQuranPageViaIndicator(page);
                                },
                                controller: state.quranIndicatorPageController,
                                children: [
                                  for (var pageIndex = 0;
                                      pageIndex < state.pages.length;
                                      pageIndex++)
                                    getPageMiniIndicatorItem(context,
                                        pageNum: pageIndex + 1,
                                        isActive: pageIndex ==
                                            state.activeQuranPageIndex)
                                ]),
                          ))),
                    ),
              body: state.quranPageController == null ||
                      state.quranIndicatorPageController == null
                  ? const Center(
                      child: Text("Loading.."),
                    )
                  : SafeArea(
                      child: GestureDetector(
                      onTap: () {
                        state.toogleIsShowToolbar();
                      },
                      child: Center(
                        child: state.pages.isEmpty
                            ? const Text('Loading Quran data ...')
                            : PageView(
                                controller: state.quranPageController,
                                reverse: true,
                                onPageChanged: (page) {
                                  if (onPageChange != null) onPageChange!(page);
                                  state.setActiveQuranPageViaQuranPage(page);
                                },
                                children: [
                                  for (var pageIndex = 0;
                                      pageIndex < state.pages.length;
                                      pageIndex++)
                                    QuranPageWidget(
                                      page: state.pages[pageIndex],
                                      config: config,
                                    )
                                ],
                              ),
                      ),
                    )),
            );
          });
        });
  }

  Widget getPageMiniIndicatorItem(BuildContext context,
      {required int pageNum, bool isActive = false}) {
    return Center(
      child: Container(
        width: 32,
        height: 42,
        child: Center(
            child: Text(
          '$pageNum',
          style: TextStyle(
              color: isActive ? config.onAccentColor : config.onSurfaceColor),
        )),
        decoration: BoxDecoration(
            color: isActive ? config.accentColor : config.surfaceColor,
            borderRadius: SizeConfig.radius / 4),
      ),
    );
  }
}

class QuranPageWidget extends StatelessWidget {
  const QuranPageWidget({
    Key? key,
    required this.page,
    required this.config,
  }) : super(key: key);

  final QuranPage page;
  final QuranPageReaderConfig config;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          config.pageMode == QuranPageMode.page
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.all(MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 12
                      : 10),
                  itemBuilder: (context, index) => SizedBox(
                    width: double.infinity,
                    // height: 40,
                    child: page.lines[index].words.isEmpty
                        ? page.lines[index].isSurahBegining
                            ? BeginingSurahCard(
                                line: page.lines[index + 2], config: config)
                            : page.lines[index].isBasmallah
                                ? BasmalahWord(
                                    config: config,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                  )
                                : const SizedBox()
                        : QuranLineWidget(
                            words: page.lines[index].words.reversed.toList(),
                            fontSize: page.lines[index].wordSpacing,
                            stretch: page.lines[index].isUsingLineStretch,
                            color: config.onBackgroundColor,
                          ),
                  ),
                  itemCount: page.lines.length,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: SizeConfig.pagePadding,
                  itemCount: page.verses.verses!.length,
                  itemBuilder: ((context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              page.verses.verses![index].words!
                                  .map((e) => "${e.qpcUthmaniHafs} ")
                                  .toList()
                                  .join(),
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: config.onBackgroundColor,
                                  fontSize: 24,
                                  fontFamily:
                                      'KFGQPCHAFSUthmanicScriptRegular')),
                          const SizedBox(
                            height: SizeConfig.s6,
                          ),
                          Text(
                            removeAllHtmlTags(page
                                .verses.verses![index].translations![0].text!),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color:
                                    config.onBackgroundColor.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            height: SizeConfig.pagePaddingNum,
                          ),
                          const MinusDividerWidget(
                              left: SizeConfig.pagePaddingNum,
                              right: SizeConfig.pagePaddingNum),
                          const SizedBox(
                            height: SizeConfig.pagePaddingNum,
                          ),
                        ],
                      ))),
          SizedBox(
            height: config.pageMode == QuranPageMode.page ? 5 : 0,
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeConfig.s18, vertical: SizeConfig.s4),
                decoration: BoxDecoration(
                    color: config.onBackgroundColor.withOpacity(0.03),
                    borderRadius: SizeConfig.radius),
                child: Text(
                  '${page.pageNumber}',
                  style: TextStyle(
                    fontSize: 12,
                    color: config.onBackgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: config.pageMode == QuranPageMode.page
                ? SizeConfig.pagePaddingNum
                : SizeConfig.pagePaddingNum * 3,
          ),
        ],
      ),
    );
  }
}

class BasmalahWord extends StatelessWidget {
  const BasmalahWord({
    Key? key,
    required this.config,
    required this.fontSize,
  }) : super(key: key);

  final double fontSize;
  final QuranPageReaderConfig config;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        "بِسْمِ اللّهِ الرَّحْمَنِ الرَّحِيْمِ",
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontFamily: 'KFGQPCHAFSUthmanicScriptRegular'),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: SizeConfig.s2),
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(vertical: 0),
    //     child: Center(
    //       child: Text(
    //         'بِسْمِ اللّهِ الرَّحْمَنِ الرَّحِيْمِ',
    //         textDirection: TextDirection.rtl,
    //         style: TextStyle(
    //             color: config.onBackgroundColor,
    //             fontSize: 24,
    //             fontFamily: 'KFGQPCHAFSUthmanicScriptRegular'),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class BeginingSurahCard extends StatelessWidget {
  const BeginingSurahCard({
    Key? key,
    required this.line,
    required this.config,
  }) : super(key: key);

  final QuranLineResultModel line;
  final QuranPageReaderConfig config;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Chapters>(
        future: QuranTool.getQuranChapterByNum(line.surahNum),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: SizeConfig.s12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: SizeConfig.s4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.s6),
                  color: config.surfaceColor),
              child: Center(
                  child: Text(
                snapshot.connectionState == ConnectionState.done &&
                        snapshot.data != null
                    ? snapshot.data!.nameArabic ?? ""
                    : "",
                style: TextStyle(
                    color: config.onSurfaceColor,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontFamily: 'KFGQPCHAFSUthmanicScriptRegular'),
              )),
            ),
          );
        });
  }
}

class QuranLineWidget extends StatelessWidget {
  const QuranLineWidget(
      {Key? key,
      required this.words,
      required this.fontSize,
      required this.stretch,
      this.color})
      : super(key: key);

  final List<Words> words;
  final double fontSize;
  final bool stretch;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // return AutoSizeText(
    //   words.map((e) => "${e.qpcUthmaniHafs} ").toList().reversed.join(),
    //   textDirection: TextDirection.rtl,
    //   textAlign: TextAlign.center,
    //   style: TextStyle(
    //       fontSize: MediaQuery.of(context).size.width * 0.07,
    //       color: color,
    //       letterSpacing: -0.5,
    //       wordSpacing: 0,
    //       fontFamily: 'KFGQPCHAFSUthmanicScriptRegular'),
    //   maxLines: 1,
    // );
    // return Text(
    //   words.map((e) => "${e.qpcUthmaniHafs} ").toList().reversed.join(),
    //   textDirection: TextDirection.rtl,
    //   style: TextStyle(
    //       fontSize: MediaQuery.of(context).size.width * 0.06,
    //       color: color,
    //       fontFamily: 'KFGQPCHAFSUthmanicScriptRegular'),
    //   textAlign: TextAlign.justify,
    // );

    return stretch == false
        ? AutoSizeText(
            words.map((e) => "${e.qpcUthmaniHafs} ").toList().reversed.join(),
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: color,
                fontSize: MediaQuery.of(context).size.width * 0.055,
                fontFamily: 'KFGQPCHAFSUthmanicScriptRegular'),
            textAlign: TextAlign.center,
            maxLines: 1,
          )
        : FittedBox(
            child: Text(
                words
                    .map((e) => "${e.qpcUthmaniHafs} ")
                    .toList()
                    .reversed
                    .join(),
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    letterSpacing: 0,
                    wordSpacing: fontSize,
                    color: color,
                    fontFamily: 'KFGQPCHAFSUthmanicScriptRegular')),
          );

    // return Row(
    //   // crossAxisAlignment: CrossAxisAlignment.center,
    //   mainAxisAlignment:
    //       stretch ? MainAxisAlignment.spaceAround : MainAxisAlignment.center,
    //   children: [
    //     for (var wordIndex = 0; wordIndex < words.length; wordIndex++)
    //       Text(
    //         "${words[wordIndex].qpcUthmaniHafs}",
    //         textDirection: TextDirection.rtl,
    //         style: TextStyle(
    //             color: color,
    //             fontSize: DzikrSizeUtils.adjustQuranTextSizeWithMediaQuery(
    //                 fontSize, context),
    //             fontFamily: 'KFGQPCHAFSUthmanicScriptRegular'),
    //       )
    //   ],
    // );
  }
}

String removeAllHtmlTags(String htmlText) {
  return htmlText.replaceAll(
      RegExp(r"<([^>]+?)([^>]*?)>(.*?)<\/\1>",
          caseSensitive: false, multiLine: true),
      "");
}
