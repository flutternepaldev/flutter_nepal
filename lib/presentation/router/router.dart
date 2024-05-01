// part of 'router_imports.dart';

// @AdaptiveAutoRouter(
//   routes: <AutoRoute>[
//     // AutoRoute(page: Splash, initial: true),
//     AutoRoute(page: Login),
//     AutoRoute(page: MainScreen),
//     AutoRoute(page: Home, initial: true),
//     AutoRoute(page: Registration),
//   ],
// )
// class $AppRouter {}

part of 'router_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: "/", initial: true),
        AutoRoute(page: MainScreenRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegistrationRoute.page),
      ];
}
