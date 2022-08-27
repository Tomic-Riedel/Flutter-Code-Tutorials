/// ------------------------------------------------------------
/// ---------Fluter GoRouter - The Complete Crash Course---------
/// --------https://medium.com/@tomicriedel/6c4545f2cfac--------
/// ------------------------------------------------------------

/// Snap 1 - Defining router variable

// First, import material.dart and go_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Now we can create our variable
final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ScreenA();
      },
    ),
    GoRoute(
      path: '/b',
      builder: (BuildContext context, GoRouterState state) {
        return ScreenB();
      },
    ),
  ],
);

/// Snap 2 - Full example of _router and MaterialApp.router
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'GoRouter Example',
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return ScreenA();
        },
      ),
      GoRoute(
        path: '/b',
        builder: (BuildContext context, GoRouterState state) {
          return ScreenB();
        },
      ),
    ],
  );
}

/// Snap 3 - Catch errors
final GoRouter _router = GoRoter(
  errorBuilder: (context, state) => ErrorScreen(state.error),
  // [...]
);

/// Snap 4 - Navigation
onTap() => GoRouter.of(context).go('/b');

// More concise way to navigate
onTap() => context.go('/b');
