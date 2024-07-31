import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/app_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool isLoggedOn = true;

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  'Feeds $index',
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onNavItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          // backgroundColor: AppColors.white.withOpacity(0.18),
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                _currentIndex == 0 ? AppIcons.homeFilled : AppIcons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Feed',
              icon: Icon(
                _currentIndex == 1 ? AppIcons.exploreFilled : AppIcons.explore,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Add',
              icon: Icon(
                _currentIndex == 2 ? AppIcons.addFilled : AppIcons.add,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Notification',
              icon: Icon(
                _currentIndex == 3 ? AppIcons.heartFilled : AppIcons.heart,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                _currentIndex == 4 ? AppIcons.personFilled : AppIcons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
