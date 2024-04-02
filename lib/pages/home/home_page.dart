import 'package:auto_route/auto_route.dart';
import 'package:ehealthapp/pages/home/widget/call_widget.dart';
import 'package:ehealthapp/pages/home/widget/home_widget.dart';
import 'package:ehealthapp/pages/home/widget/step_widget.dart';
import 'package:ehealthapp/pages/home/widget/user_widget.dart';
import 'package:ehealthapp/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget? _child;

  @override
  void initState() {
    _child = const HomeWidget();
    super.initState();
  }

  @override
  Widget build(context) {
    // Build a simple container that switches content based of off the selected navigation item
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        body: _child,
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                unselectedForegroundColor: Colors.black,
                svgPath: "assets/images/home.svg",
                backgroundColor: AppColors.white,
                extras: {"label": "home"}),
            FluidNavBarIcon(
                unselectedForegroundColor: Colors.black,
                svgPath: "assets/images/call2.svg",
                backgroundColor: AppColors.white,
                extras: {"label": "call"}),
            FluidNavBarIcon(
                unselectedForegroundColor: Colors.black,
                svgPath: "assets/images/step.svg",
                backgroundColor: AppColors.white,
                extras: {"label": "step"}),
            FluidNavBarIcon(
                unselectedForegroundColor: Colors.black,
                svgPath: "assets/images/icon.svg",
                backgroundColor: AppColors.white,
                extras: {"label": "icon"}),
          ],
          onChange: _handleNavigationChange,
          style: const FluidNavBarStyle(
              iconUnselectedForegroundColor: Colors.white),
          scaleFactor: 1.5,
          defaultIndex: 0,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras!["label"],
            child: item,
          ),
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = const HomeWidget();
          break;
        case 1:
          _child = const CallWidget();
          break;
        case 2:
          _child = const StepWidget();
          break;
        case 3:
          _child = const UserWidget();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
