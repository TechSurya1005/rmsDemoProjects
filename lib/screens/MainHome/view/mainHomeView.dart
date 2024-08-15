import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:rms_demo/screens/Employees/view/employeeView.dart';
import 'package:rms_demo/screens/Projects/view/projectsView.dart';
import 'package:rms_demo/screens/Revenue/view/revenueView.dart';

import '../../../constant/color.dart';
import '../viewModal/mainHomeViewModal.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  PersistentTabController? _controller;

  setPageInitial() {
    if (mounted) {
      final mainHomeController =
          Provider.of<MainHomeViewViewModal>(context, listen: false);
      mainHomeController.changeIndexAccordingScreen(0);
    }
  }

  @override
  void initState() {
    setPageInitial();
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [const EmployeeView(), const ProjectsView(), const RevenueView()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.groups),
        title: 'Employees',
        activeColorPrimary: accentColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.note_alt_rounded),
        title: 'Projects',
        activeColorPrimary: accentColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.insert_chart),
        title: 'Revenue',
        activeColorPrimary: accentColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainHomeViewViewModal>(
      builder: (context, mainHomeProvider, child) {
        return Scaffold(
          extendBody: false,
          body: PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineToSafeArea: true,
            backgroundColor: primaryColor,
            // Default is Colors.white.
            handleAndroidBackButtonPress: true,
            // Default is true.
            resizeToAvoidBottomInset: true,
            // This needs to be true if you want to move up the screen when keyboard appears.
            stateManagement: true,
            // Default is true.
            hideNavigationBarWhenKeyboardAppears: true,
            // Recommended to set 'resizeToAvoidBottomInset' as true
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: primaryColor,
            ),
          ),
        );
      },
    );
  }
}
