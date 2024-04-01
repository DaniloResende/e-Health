import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:ehealthapp/router/router.dart';
import 'package:flutter/material.dart';

import '../../util/colors.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayAnimation, transfor;
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    transfor = BorderRadiusTween(
            begin: BorderRadius.circular(125.0),
            end: BorderRadius.circular(0.0))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.ease));
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
    Timer(const Duration(seconds: 3), () async {
      AutoRouter.of(context).replace(const LoginRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Scaffold(
              body: Container(
                decoration: const BoxDecoration(color: AppColors.white),
                child: Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ));
  }
}
