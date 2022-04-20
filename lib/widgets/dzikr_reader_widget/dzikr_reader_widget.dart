import 'package:dzikr/core/config/size_config.dart';
import 'package:dzikr/core/utils/theme_utils.dart';
import 'package:dzikr/data/book_data/book_data_model/book_data_model.dart';
import 'package:dzikr/data/book_data/book_data_model/book_type.dart';
import 'package:dzikr/widgets/dzikr_reader_widget/dzikr_reader_state.dart';
import 'package:dzikr/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:dzikr/widgets/opacity_pressed_widget/opacity_pressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DzikrReaderWidget extends StatelessWidget {
  const DzikrReaderWidget({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    //final jsonBook = book.toJson();
    return ChangeNotifierProvider<DzikrReaderState>(
      create: (context) =>
          DzikrReaderState(dataLength: book.collection!.length),
      builder: (context, child) {
        DzikrReaderState state =
            Provider.of<DzikrReaderState>(context, listen: false);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(SizeConfig.pagePaddingNum),
              child: Container(
                padding: const EdgeInsets.all(SizeConfig.pagePaddingNum),
                decoration: BoxDecoration(
                    color: colorSchame(context).primary,
                    borderRadius: SizeConfig.radius),
                child: Row(
                  children: [
                    OpacityPressedWidget(
                      onPress: () {
                        state.prevIndex();
                      },
                      child: Icon(
                        Icons.chevron_left_rounded,
                        color: colorSchame(context).onPrimary,
                      ),
                    ),
                    Consumer<DzikrReaderState>(
                      builder: ((context, state, child) => Expanded(
                              child: Text(
                            book.collection![state.currentCollectionIndex]
                                .titleId!,
                            textAlign: TextAlign.center,
                            style: textTheme(context).headline1?.copyWith(
                                color: colorSchame(context).onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))),
                    ),
                    OpacityPressedWidget(
                      onPress: () {
                        state.nextIndex();
                      },
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: colorSchame(context).onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const MinusDividerWidget(
                left: SizeConfig.pagePaddingNum,
                right: SizeConfig.pagePaddingNum),
            Consumer<DzikrReaderState>(
                builder: ((context, state, child) => Expanded(
                        child: PageView(
                      controller: state.pageController,
                      onPageChanged: (page) {
                        state.setCollectionIndex(page);
                      },
                      children: [
                        for (var collectionIndex = 0;
                            collectionIndex < book.collection!.length;
                            collectionIndex++)
                          ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(
                                  SizeConfig.pagePaddingNum),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: SizeConfig.s24,
                                  ),
                                  Text(
                                    book.collection![collectionIndex]
                                        .content![index].ar!,
                                    style: TextStyle(
                                        fontSize: 20,
                                        height: 1.8,
                                        fontFamily: book
                                                    .collection![
                                                        collectionIndex]
                                                    .content![index]
                                                    .type ==
                                                BookType.quran
                                            ? 'KFGQPCHAFSUthmanicScriptRegular'
                                            : null),
                                    textDirection: TextDirection.rtl,
                                  ),
                                  const SizedBox(
                                    height: SizeConfig.s24,
                                  ),
                                  Text(
                                    book.collection![collectionIndex]
                                        .content![index].id!,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: SizeConfig.s32,
                                  ),
                                  const MinusDividerWidget(
                                      left: SizeConfig.pagePaddingNum,
                                      right: SizeConfig.pagePaddingNum),
                                ],
                              ),
                            ),
                            itemCount: book
                                .collection![state.currentCollectionIndex]
                                .content!
                                .length,
                            shrinkWrap: true,
                          ),
                      ],
                    )))),
          ],
        );
      },
    );
  }
}
