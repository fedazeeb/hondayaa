import 'package:flutter/material.dart';

class BNavigation extends StatelessWidget {
  const BNavigation({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      // backgroundColor: Colors.brown,
      selectedIconTheme: IconThemeData(
        size: 30,
      ),
      onTap: (index) {
        if (index == 0)
          Navigator.of(context).pushReplacementNamed('dashboardtitle');
        else if (index == 1)
          Navigator.of(context).pushReplacementNamed('myhomepage');
        else if (index == 2)
          Navigator.of(context).pushReplacementNamed('mysetting');
      },
      items: [
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color:
                  (selectedIndex == 0) ? Theme.of(context).primaryColor : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.list_alt,
                color: Colors.white,
              ),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color:
                  (selectedIndex == 1) ? Theme.of(context).primaryColor : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.car_repair,
                color: Colors.white,
              ),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color:
                  (selectedIndex == 2) ? Theme.of(context).primaryColor : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
