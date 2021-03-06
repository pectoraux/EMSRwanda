import 'package:flutter/material.dart';
import 'main_menu.dart';
import 'models.dart';
import 'edit_tag.dart';
import 'edit_project.dart';
import 'profile_header.dart';
import 'quick_actions.dart';
import 'constants.dart';
import 'edit_device.dart';
import 'edit_role.dart';
import 'explore_users.dart';

class StaffNStatsPage extends StatefulWidget {

  @override
  StaffNStatsPageState createState() => StaffNStatsPageState();
}

class StaffNStatsPageState extends State<StaffNStatsPage> {

  /// This controller can be used to programmatically
  /// set the current displayed page
  PageController _pageController;

  /// Indicating the current displayed page
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final navigationItems = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: new Icon(Icons.assessment, color: getColor(0)),
          title: new Text("Project\nStats")),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.people, color: getColor(1),),
          title: new Text("Staff")),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.border_outer, color: getColor(2),),
          title: new Text("Scan QR Code")),
    ];

    final profile = getProfile();

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new PageView(
          children: [
            new Container(color: Colors.grey,),
            new ExploreUsersPage(),
            new Container(color: Colors.brown,),
          ],
          controller: _pageController,
          onPageChanged: onPageChanged
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _page,
        items: navigationItems,
        onTap: navigationTapped,
        fixedColor: TodoColors.primaryLight,
        iconSize: 25.0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  /// Called when the user presses on of the
  /// [BottomNavigationBarItem] with corresponding
  /// page index
  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Color getColor(int idx) {
    final iconColor = Color(0xEFCCCCCD);
    if (_page == idx) {
      return TodoColors.primaryDark;
    } else {
      return iconColor;
    }
  }
}

