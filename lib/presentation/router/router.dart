part of 'router_imports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // AutoRoute(page: Splash, initial: true),
    AutoRoute(page: Login),
    AutoRoute(page: MainScreen),
    AutoRoute(page: Home, initial: true),
    AutoRoute(page: Registration),
  ],
)
class $AppRouter {}
