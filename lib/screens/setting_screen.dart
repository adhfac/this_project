import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:this_project/screens/auth_screen.dart';
import 'package:this_project/util/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    Future<void> signOut(BuildContext context) async {
      await FirebaseAuth.instance.signOut();

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const StartScreen()),
        (Route<dynamic> route) => false,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'playpen',
            fontWeight: FontWeight.bold,
            color: Color(0xFFA80038),
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 1.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 164, 164, 164),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text(
              'Mode Gelap',
              style: TextStyle(
                fontFamily: 'playpen',
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Switch(
              value: themeProvider.isDark,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Log Out',
              style: TextStyle(
                fontFamily: 'playpen',
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  signOut(context);
                },
                icon: const Icon(Icons.logout_outlined)),
          )
        ],
      ),
    );
  }
}
