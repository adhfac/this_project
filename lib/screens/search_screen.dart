import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Search',
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
          body: Center(
            child: Text('Halo'),
          )),
    );
  }
}
