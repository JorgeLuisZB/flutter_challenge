import 'package:flutter/material.dart';
import 'package:jorge_zaragoza_challenge/theme/theme.dart';
import 'package:jorge_zaragoza_challenge/routes/app_routes.dart';
import 'package:jorge_zaragoza_challenge/widgets/scroll_grow_remover.dart';

void main() => runApp(MyApp());

/// App with dark mode support
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge',
      theme: themeLight,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: appRoutes,
      builder: (context, child) =>
          ScrollConfiguration(behavior: ScrollGrowRemover(), child: child!),
    );
  }
}
