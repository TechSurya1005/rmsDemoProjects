import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rms_demo/app/routes/routes.dart';
import 'package:rms_demo/screens/Employees/view/employeeView.dart';
import 'package:rms_demo/screens/MainHome/view/mainHomeView.dart';
import 'package:rms_demo/screens/splash/view/SplashView.dart';

class GoRouteCall {
  final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        name: AppRoutes.splash,
        path: AppRoutes.splash,
        builder: (BuildContext context, GoRouterState state) =>
        const SplashView(),
      ),
      GoRoute(
        name: AppRoutes.homeMain,
        path: AppRoutes.homeMain,
        builder: (BuildContext context, GoRouterState state) =>
        const MainHomeView(),
      ),GoRoute(
        name: AppRoutes.employeeView,
        path: AppRoutes.employeeView,
        builder: (BuildContext context, GoRouterState state) =>
        const EmployeeView(),
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) => Scaffold(
      body: Center(
        child: Text(
          "No route defined",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    ),
  );
}
