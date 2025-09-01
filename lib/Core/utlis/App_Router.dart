import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:movie_verse/Features/Auth/presentation/Views/Login%20Views/Login_page.dart';
import 'package:movie_verse/Features/Auth/presentation/Views/Register%20Views/Register_View.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/Detials_View.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Home_view.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/Search_View.dart';

import 'package:movie_verse/Features/Splash/presentation/Views/On_boarding_View.dart/On_Boarding_View.dart';
import 'package:movie_verse/Features/Splash/presentation/Views/Splash_View/Splash_view.dart';

abstract class AppRouter {
  static final onboardinview1 = '/onboarding1';
  static final loginpage = '/loginpage';
  static final registerpage = '/registerpage';
  static final homeview = '/homeview';
  static final detialsview = '/detialsview';
  static final searchview = '/searchview';
  static final viewallpage = '/viewallpage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SplashView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        path: onboardinview1,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const OnBoardingView1(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        path: homeview,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        path: loginpage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        path: registerpage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const RegisterView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        path: detialsview,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const DetialsView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        path: searchview,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SearchView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
    ],
  );
}
