import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rms_demo/app/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    authCheck();
    super.initState();
  }

  authCheck() {
    if (mounted) {
      Future.delayed(const Duration(seconds: 3)).then((_) {
        context.go(AppRoutes.homeMain);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/lgoorms.png",
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}
