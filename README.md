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

Praise to Allah.

Dzikr design to be all-in and easy use package that collecting islamic useful feature for your Flutter App

For now you can use Dzikr for :
- Adding Quran Feature your app using [QuranTool]
- Adding Dzikr and Du'a feature to your app using [BookTool]
- Adding Prayer Time Schedule to your ap using [PrayerTimeTool]

Dzikr currently still on beta version development.

May Allah guide and help us always.

## Features

Big picture of package to getting started with it.

### QuranTool
Contain methods for getting Quran data.

QuranTool Feature :
- get all quran pages data
- get list of juzs in Quran
- get list of surah in Quran

QuranTool using static assets of Quran data.
You must preparing the data and save it into your project, on assets/quran folder.

For fast way to processing the data, and render it and showing to user, Dzikr has provide you [QuranPageReader] widget, that will be inform below.

#### QuranPageReader
QuranPageReader will automaticly processing data from QuranTool and show/render it as interface to user.

To use it :
```dart
class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuranPageReader(config: QuranPageReaderConfig());
  }
}
```

Use [QuranPageReaderConfig] to make configuration on your QuranPageReader


### PrayerTimeTool
Contain methods for getting prayer time schedule.


### BookTool
Contain methods for (islamic) text (like du'a and adzkar).


<!-- ## Features

Adding Quran, Dzikr and Dua's and Prayer time to your Flutter App.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more. -->
