import 'package:flutter/material.dart';
import 'package:god_mode/features/installed_apps/installed_apps.dart';
import 'package:god_mode/l10n/l10n.dart';

class GodModeApp extends StatelessWidget {
  const GodModeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const InstalledAppsPage(),
    );
  }
}
