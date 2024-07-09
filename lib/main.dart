import 'package:dom/page/detail_reciper.dart';
import 'package:dom/page/home.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
              builder: (context) => const Home(),
              settings: settings,
            );
          case 'detail_reciper':
            return CupertinoPageRoute(
              builder: (context) => const DetailReciper(),
              settings: settings,
            );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.activeOrange,
      ),
      title: 'Dome',
      initialRoute: '/',
    );
  }
}
