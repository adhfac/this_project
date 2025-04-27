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
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SettingScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Menambahkan efek slide dari kanan ke kiri
                      const begin = Offset(1.0, 0.0); // mulai dari kanan
                      const end = Offset.zero; // berakhir di posisi normal
                      var tween = Tween(begin: begin, end: end).chain(
                          CurveTween(
                              curve: Curves
                                  .easeInOut));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                          position: offsetAnimation, child: child);
                    },
                  ),
                );
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
