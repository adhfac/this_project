import 'package:this_project/screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:this_project/screens/profile_screen.dart';
import 'package:this_project/screens/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFA80038),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFFBF9FA),
        unselectedItemColor: const Color.fromARGB(255, 128, 128, 128),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'playpen', // Ganti dengan nama font kustom Anda
          fontWeight: FontWeight.bold,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const StartScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Semuria',
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
          actions: [
            IconButton(
                onPressed: () {
                  signOut(context);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Center(
          child: Text('Halo'),
        ));
  }
}
