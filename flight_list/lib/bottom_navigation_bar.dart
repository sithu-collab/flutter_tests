import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  final bottomBarTextStyle = TextStyle(color: Colors.black, fontFamily: 'Montserrat');
  
  CustomAppBar() {
    bottomBarItems.add(BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.black,),
      title: Text('Explore', style: bottomBarTextStyle,),
    ));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.favorite, color: Colors.black,),
        title: Text('Watchlist', style: bottomBarTextStyle,)
    ));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.local_offer, color: Colors.black,),
        title: Text('Deals', style: bottomBarTextStyle,)
    ));
    bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.notifications, color: Colors.black,),
        title: Text('Notifications', style: bottomBarTextStyle,)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}



