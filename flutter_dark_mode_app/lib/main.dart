import 'package:flutter/material.dart';
import 'package:flutter_dark_mode_app/theme_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/theme_create_with_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider<CustomTheme>(
      create: (context) => CustomTheme(isDark: prefs.getBool('isDark')),
      builder: (context, _) => MyAppBase(),
    ),
  );
}

class MyAppBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: Provider.of<CustomTheme>(context).getThemeMode(),
      home: HomeAppBase(),
    );
  }
}
