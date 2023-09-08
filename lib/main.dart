import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mean_calc/src/exceptions/async_error_logger.dart';
import 'package:mean_calc/src/exceptions/error_logger.dart';
import 'package:mean_calc/src/features/cart/application/cart_sync_service.dart';
import 'package:mean_calc/src/features/cart/data/local/local_cart_repository.dart';
import 'package:mean_calc/src/features/cart/data/local/sembast_cart_repository.dart';
import 'package:mean_calc/src/features/firestore/login_info.dart';
import 'package:mean_calc/src/features/firestore/reposotory/subject_repository.dart';
import 'package:mean_calc/src/models/target_subject.dart';
import 'package:mean_calc/src/routing/app_router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  final localCartRepository = await SembastCartRepository.makeDefault();
  final container = ProviderContainer(
    overrides: [
      localCartRepositoryProvider.overrideWithValue(localCartRepository),
    ],
    observers: [AsyncErrorLogger()],
  );
  container.read(cartSyncServiceProvider);
  final errorLogger = container.read(errorLoggerProvider);

  registerErrorHandlers(errorLogger);
  LoginInfo li = LoginInfo();
  await li.initializeFirebaseAuth();
  // 임시로 이렇게는 해두지만 바꿔야함
  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  ));
}

void registerErrorHandlers(ErrorLogger errorLogger) {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'MeanCalc',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
        ),
      ),
    );
  }
}
