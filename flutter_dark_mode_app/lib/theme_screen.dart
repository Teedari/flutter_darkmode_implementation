import 'package:flutter/material.dart';
import 'package:flutter_dark_mode_app/services/theme_create_with_provider.dart';
import 'package:provider/provider.dart';

class HomeAppBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: DarkModeSwitcher())],
        ),
      ),
    );
  }
}

class DarkModeSwitcher extends StatelessWidget {
  const DarkModeSwitcher({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomTheme>(context, listen: false);
    return Switch(
        value: provider.isDark,
        onChanged: (val) {
          provider.swithThemeMode(darkMode: val);
        });
  }
}
