<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
---
sidebar_position: 1
---
# Introduction
<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
Bismillah, Alhamdulillah, Washalatu Wasalam 'Ala Rasulillah.  
Praise to Allah, may the peace and blessing always be upon to our Prophet Muhammad Shallallahu 'alaihi wasalam.  
  
Today, technology is developing quickly. As we know Technology can be a tool that really helps us in our daily task and work. Also if we used it properly, it can support our ibadah to Allah.

Supporting tools such as prayer schedules, Al Quran and a collection of adzkar can be accessed easily through technology such as our phone.

The tools mentioned are very basic and are often used nowdays, you will find various applications that require or at least use tools that mentioned above. So, it inspires us to make it easier for developers to bring these features to people quickly and easily.

introduces Dzikr, a collection of worship support tools for the powerful cross-platform framework, Flutter. What is Dhikr and what can you do with it, insyaallah that will be explained further below.

## Dzikr
Dzikr is a collection of islamic features tools for Flutter app development, Dzikr collect many dependecy and APIS, organize and process it to be ready used feature in your app.

### Tool List
the following is a list of Dzikr main tools :
- [Prayer Time Tool][1]
- [Quran Tool][2]
- [Book Tool (used for adzkar)][3]

### Current Version Information
> **Warning**  
> Dzikr is currently on beta version. Some features are still on best practice research and may feel buggy, major changes may happen in future version releases.

### Installation

Install using pub

```bash
flutter pub add dzikr
```

> **Note**  
> There is requirement things todo in every specific tools in Dzikr, you can read it in each tool section

Quick hint : Prayer Tools will require you to adding location premission on both Android Manifest and iOS info.plist as the tool contain geolocator, Quran tool wil required you static quran .json file, also with Book tool.

Use Dzikr in your dart file by importing it 

```dart
import 'package:dzikr/dzikr.dart';
```

## Prayer Time Tool
Prayer Time Tool is tool for showing prayer schedule based on user location, this package contain geolocator and need premission for using gps, the Tool is returning today and monthly prayer schedule, also device location info that can be showed to user.

### Requirement
This package include [Geocoding](https://pub.dev/packages/geolocator) that need user premission for process device location.

1. Please following official [Geocoding Usage Guide](https://pub.dev/packages/geolocator#usage) for adding permission both in Android and iOS.

after that all done Insyaallah, the tool is ready for use.

### Usage

1. Init the Tool
```dart
QuranTool quranTool = QuranTool.init();
```
2. Get the prayer time
```dart
getPrayerTime() async {
  try {
      PrayerTimeTool prayerTimeTool = await PrayerTimeTool.init();
      PrayerTime prayer = prayerTimeTool.prayer;
    } on DzikrErrorConfig catch (error) {
      // error
      print(error.message);
    }
}
```
3. Show the data to your user
```dart
Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Text(prayer
            .todaySchedule.closestPrayer.closestPrayer,
        style: ThemeConfig.textTheme(context)
            .headline1
        ),
        Text(prayer.todaySchedule.closestPrayer.closestTime,
        style: ThemeConfig.textTheme(context)
            .headline2
        ),
        Text("${PrayerTimeTool.findClosestPrayerTime(prayer).todaySchedule.closestPrayer.durationToClosestPrayer.inMinutes} Minute to ${prayer.todaySchedule.closestPrayer.closestPrayer}"),
    ],
);
```

Awesome ✨ Masyaallah.

## Quran Tool
Quran is one of the most feature that we hope can provide with well in this package. This feature is still under development, there is minor in the code but it works!

This tool provide Quran both in page mode and list mode.
And the cool part Quran Tool provide instant Quran render widget, we will show the detail of it bellow insyaallah.

### Requirement
Quran Tool is using static Quran data, you need to downloaded the data first, put it into assets/quran directory, register the asset path into pubspec.yaml the you'll be able to use the tool insyaallah.

1. You can download the tool hare : [this link](https://dzikr-docs.vercel.app/zip/quran.zip)
2. Put quran directory on ./assets folder of your project
3. register the asset in pubspec.yaml, as below
```yaml
assets:
  - assets/quran/
```

then the tool is ready to use insyaallah.

### Usage
The easy wasy to show Quran to your app user is using [QuranPageReader].
as easy as bellow instruction.

1. return the Quran page in your page/widget.
```dart
class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuranPageReader(
      config: QuranPageReaderConfig(),
    );
  }
}
```

if there is no mistake, Quran data will be processed and showed to user 👍

2. via parameter you can set the intial Quran page that want to be showed, you even able put appbar on your [QuranPageReader] or listen when user change the Quran Page.
3. And with [QuranPageReaderConfig] you able to set colors and theming for your [QuranPageReader], also to choose is using page mode or list mode, and to show bottom page indicator or not.

then, how to show list of surah and juzs?
Quran Tool will provide the data for you.

1. Init Quran Tool
```dart
QuranTool quranTool = QuranTool.init();
```
2. get the data
```dart
QuranJuzs juzs = await quranTool.getQuranJuzs();
QuranChapters surah = await quranTool.getQuranChapter();
```

you even able to get whole Quran data, if you want to manually process it without [QuranPageReader].
```dart
List<QuranPage> pages = await quranTool.getQuranPages();
```

## Book Tool 
Book tool actually is tool for showing adzkar and du'a, we named it book because we imagining a collection of du'as or dzikr as a book that contain list of prayer and book, not only that, in the future we also hope to present hadith books.

Same with Quran Tool, you need to download the Book data first, as this following.

### Requirement
1. You can download the tool hare : [this link](https://dzikr-docs.vercel.app/zip/books.zip)
2. Put quran directory on ./assets folder of your project
3. register the asset in pubspec.yaml, as below
```yaml
assets:
  - assets/book/
```

### Usage
1. Init the tool
```dart
BookTool bookTool = BookTool.init();
```
2. Get the data
```dart
List<Book> duaBook = await bookTool.getDuaBook();
List<Book> dzikrBook = await bookTool.getDzikrBook();
```
3. Show doa and dzikr to your user, you can use ListView to render every item.
4. You can process book detail by your own, or easily with [DzikrReader] as use it as following
```dart
class DzikrDetailPage extends StatelessWidget {
  const DzikrDetailPage({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppBar(context, title: book.title!),
      body: DzikrReader(book: book),
    );
  }
}
```

Hope the package and the explanation above can be useful and beneficial for many people. May Allah help and guide us always. 

[1]: #prayer-time-tool
[2]: #quran-tool
[3]: #book-tool