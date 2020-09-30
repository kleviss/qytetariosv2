import 'package:flutter/material.dart';
import 'package:qytetarios/src/view_models/app_key.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider( create: (_) => Keys()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QytetarIN',
      theme: ThemeData(
        // adding a theme

        brightness: Brightness.light, //changing the theme to dark
        primaryColor: Colors.red,
        accentColor: Colors.redAccent[300],

        fontFamily: 'NotoSansArabic',
        tabBarTheme: TabBarTheme(),
        iconTheme: IconThemeData(),
      ),

      home: HawalnirHome(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{

      },
    ),
  ));
}
