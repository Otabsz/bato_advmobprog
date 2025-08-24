import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
 
// ignore: camel_case_types
class settings_screen extends StatelessWidget {
  const settings_screen({super.key});
 
  @override
  Widget build(BuildContext context) {
    final themeModel = context.watch<ThemeProvider>();
 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                themeModel.isDark ? Icons.dark_mode : Icons.light_mode,
              ),
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: themeModel.isDark,
                onChanged: (_) => themeModel.toggleTheme(),
              ),
            ),
            //  add more settings
          ],
        ),
      ),
    );
  }
}