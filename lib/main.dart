import 'package:flutter/material.dart';

import 'modules/home/pages/home_page.dart';
import 'src/routes.dart';
import 'src/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AGroup',
      theme: CustomTheme.defaultThemeData,
      initialRoute: Routes.home,
      builder: (c, b) => Directionality(
        textDirection: TextDirection.rtl,
        child: Builder(
          builder: (BuildContext context) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: b,
            );
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.home: (_) => HomePage(),
      },
    );
  }
}
