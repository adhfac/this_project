import 'package:flutter/material.dart';
import 'package:this_project/screens/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()));
              },
              icon: const Icon(Icons.settings_outlined))
        ],
      ),
      body: Center(
        child: Text('Halo'),
      ),
    );
  }
}
