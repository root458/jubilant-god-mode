import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InstalledAppsPage extends StatelessWidget {
  const InstalledAppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Installed Apps')),
      body: FutureBuilder<List<AppInfo>>(
        future: _getInstalledApps(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No apps found'));
          }

          final apps = snapshot.data!;
          return ListView.builder(
            itemCount: apps.length,
            itemBuilder: (context, index) {
              final app = apps[index];
              return ListTile(
                leading: app.icon != null
                    ? Image.memory(app.icon!, width: 40, height: 40)
                    : const Icon(Icons.android),
                title: Text(app.name),
                subtitle: Text(app.packageName),
                onTap: () => _launchApp(app.packageName),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<AppInfo>> _getInstalledApps() async {
    const platform = MethodChannel('com.suis.god_mode/app_list');
    final result = await platform.invokeMethod('getInstalledApps');
    if (result is! List<dynamic>) {
      throw Exception(
        'Expected a List from getInstalledApps, but got ${result.runtimeType}',
      );
    }
    return result
        .map((app) => AppInfo.fromMap(app as Map<dynamic, dynamic>))
        .toList();
  }

  Future<void> _launchApp(String packageName) async {
    const platform = MethodChannel('com.suis.god_mode/app_list');
    await platform.invokeMethod('launchApp', {'packageName': packageName});
  }
}

class AppInfo {
  AppInfo({required this.name, required this.packageName, this.icon});

  factory AppInfo.fromMap(Map<dynamic, dynamic> map) {
    return AppInfo(
      name: map['name'] as String,
      packageName: map['packageName'] as String,
      icon: map['icon'] != null
          ? Uint8List.fromList(List<int>.from(map['icon'] as List<dynamic>))
          : null,
    );
  }
  final String name;
  final String packageName;
  final Uint8List? icon;
}
