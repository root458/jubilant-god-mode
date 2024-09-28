import 'package:flutter/material.dart';

class RunningAppsView extends StatelessWidget {
  const RunningAppsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Running Apps'),
      ),
      body: const Center(
        child: Text('Running Apps'),
      ),
    );
  }
}
