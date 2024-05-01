import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'bloc/user_cubit/user_cubit.dart';
import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'data/api/api.dart';
import 'data/repositories/repository.dart';
import 'logic/debug/app_bloc_observer.dart';
import 'presentation/router/router_imports.dart';
import 'utilities/local_storage_service.dart';

final getItInstance = GetIt.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  setPathUrlStrategy();
  try {
    final localDb = await SharedPreferences.getInstance();
    getItInstance
        .registerSingleton<LocalStorageService>(LocalStorageService(localDb));
  } on Exception catch (e) {
    debugPrint('Local DB Initialization Failed: $e');
  }
  runApp(
    RepositoryProvider(
      create: (context) => Repository(
        authApi: AuthApi(getItInstance<LocalStorageService>()),
        othersApi: OthersApi(getItInstance<LocalStorageService>()),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(),
      child: MaterialApp.router(
        title: Strings.appTitle,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
