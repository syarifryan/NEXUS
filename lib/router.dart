import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_app/features/splash/presentation/pages/splash_page.dart';
import 'package:nexus_app/features/auth/presentation/pages/login_page.dart';
import 'package:nexus_app/features/dashboard/presentation/pages/dashboard_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);
