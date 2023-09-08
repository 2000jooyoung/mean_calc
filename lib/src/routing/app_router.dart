import 'package:mean_calc/display_mean_page.dart';
import 'package:mean_calc/editable_score_table.dart';
import 'package:mean_calc/src/features/authentication/data/fake_auth_repository.dart';
import 'package:mean_calc/src/features/input_subjects/input_subject_home.dart';
import 'package:mean_calc/src/features/products/presentation/home/main_home.dart';
import 'package:mean_calc/src/features/products/presentation/product_screen/product_screen.dart';
import 'package:mean_calc/src/features/reviews/presentation/leave_review_screen/leave_review_screen.dart';
import 'package:mean_calc/src/routing/go_router_refresh_stream.dart';
import 'package:mean_calc/src/routing/not_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  home,
  product,
  leaveReview,
  cart,
  checkout,
  orders,
  account,
  signIn,
}

enum AppRoutee {
  home,
  inputSubjects,
  calculateMean,
  deleteSubject,
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path == '/signIn') {
          return '/';
        }
      } else {
        if (path == '/account' || path == '/orders') {
          return '/';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutee.home.name,
        builder: (context, state) => const MainHome(),
        routes: [
          GoRoute(
            path: 'inputSubjects',
            name: AppRoutee.inputSubjects.name,
            builder: (context, state) {
              return const InputSubjectHome();
            },
            routes: [
              GoRoute(
                path: 'calculateMean',
                name: AppRoutee.calculateMean.name,
                builder: (context, state) {
                  return const DisplayMeanPage();
                },
              ),
            ],
          ),
          GoRoute(
            path: 'deleteSubject',
            name: AppRoutee.deleteSubject.name,
            builder: (context, state) {
              final productId = state.pathParameters['id']!;
              return ProductScreen(productId: productId);
            },
          )
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
