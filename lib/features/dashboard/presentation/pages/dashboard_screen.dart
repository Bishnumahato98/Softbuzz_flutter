import 'package:flutter/material.dart';
import 'package:softbuzz_app/features/dashboard/presentation/pages/bottomnav/home_screen.dart';
import 'package:softbuzz_app/features/dashboard/presentation/pages/bottomnav/matches.dart';
import 'package:softbuzz_app/features/dashboard/presentation/pages/bottomnav/more.dart';
import 'package:softbuzz_app/features/dashboard/presentation/pages/bottomnav/news.dart';
import 'package:softbuzz_app/features/dashboard/presentation/pages/bottomnav/videos.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MatchesScreen(),
    VideosScreen(),
    NewsScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_cricket),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Videos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
        ],
      ),
    );
  }
}
