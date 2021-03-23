import 'package:flutter/material.dart';
import 'package:vk_responsive/config/palette.dart';

import 'pages/pages.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold_bg
      ),
      home: NavPage(),
    );
  }
}
