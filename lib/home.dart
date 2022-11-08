import 'package:flutter/material.dart';

import 'Routine/Routine_view.dart';
import 'exercise/exercise_view.dart';
import 'meeting/meeting_view.dart';
import 'shared/shared.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIdx = 0;
  List<Widget> listWidget = [
    const Meeting(),
    const Routine(),
    const Exercise(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget[_currentIdx],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'meeting',
            icon: svgIcon[IconType.home] as Widget,
            activeIcon: svgIcon[IconType.homeOrange] as Widget,
          ),
          BottomNavigationBarItem(
            label: 'routine',
            icon: svgIcon[IconType.calendar] as Widget,
            activeIcon: svgIcon[IconType.calendarOrange] as Widget,
          ),
          BottomNavigationBarItem(
            label: 'exercise',
            icon: svgIcon[IconType.exercise] as Widget,
            activeIcon: svgIcon[IconType.exerciseOrange] as Widget,
          ),
        ],
        selectedItemColor: customColor[ColorType.orange],
        currentIndex: _currentIdx,
        onTap: (value) => setState(
          () {
            _currentIdx = value;
          },
        ),
      ),
    );
  }
}
