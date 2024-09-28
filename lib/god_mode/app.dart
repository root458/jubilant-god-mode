import 'package:flutter/material.dart';
import 'package:god_mode/features/installed_apps/installed_apps.dart';
import 'package:god_mode/l10n/l10n.dart';

class GodModeApp extends StatelessWidget {
  const GodModeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const InstalledAppsPage(),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      primaryColor:
          brightness == Brightness.light ? Colors.white : Colors.black,
      scaffoldBackgroundColor:
          brightness == Brightness.light ? Colors.white : Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor:
            brightness == Brightness.light ? Colors.white : Colors.black,
        foregroundColor:
            brightness == Brightness.light ? Colors.black : Colors.white,
        elevation: 0,
      ),
      textTheme: brightness == Brightness.light
          ? Typography.material2018().white
          : Typography.material2018().black,
      iconTheme: IconThemeData(
        color: brightness == Brightness.light ? Colors.black : Colors.white,
      ),
      // Add more theme properties as needed
    );
  }
}
