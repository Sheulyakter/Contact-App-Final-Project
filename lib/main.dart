import 'package:assignment_flutter_intern/src/view/screen_dashboard.dart';
import 'package:assignment_flutter_intern/src/view/screen_hero_details.dart';
import 'package:flutter/material.dart';

import 'src/model/hero.dart';
import 'src/utils/helper.dart';
import 'src/view/screen_dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intern Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
