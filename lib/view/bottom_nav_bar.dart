import 'package:flutter/material.dart';
import 'package:movie_app/view/favoriet_Screen.dart';
import 'package:movie_app/view/movie_list.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    MovieListScreen(),
    FavoriteMoviesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        backgroundColor: Colors.grey[700],
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: const Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Favorites",
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
