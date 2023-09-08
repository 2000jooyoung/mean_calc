import 'package:mean_calc/src/constants/breakpoints.dart';
import 'package:mean_calc/src/features/authentication/data/fake_auth_repository.dart';
import 'package:mean_calc/src/features/products/presentation/home_app_bar/more_menu_button.dart';
import 'package:mean_calc/src/features/products/presentation/home_app_bar/shopping_cart_icon.dart';
import 'package:mean_calc/src/localization/string_hardcoded.dart';
import 'package:mean_calc/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:mean_calc/src/common_widgets/action_text_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Custom [AppBar] widget that is reused by the [ProductsListScreen] and
/// [ProductScreen].
/// It shows the following actions, depending on the application state:
/// - [ShoppingCartIcon]
/// - Orders button
/// - Account or Sign-in button
class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    // * This widget is responsive.
    // * On large screen sizes, it shows all the actions in the app bar.
    // * On small screen sizes, it shows only the shopping cart icon and a
    // * [MoreMenuButton].
    // ! MediaQuery is used on the assumption that the widget takes up the full
    // ! width of the screen. If that's not the case, LayoutBuilder should be
    // ! used instead.
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < Breakpoint.tablet) {
      return AppBar(
        title: Text('Calculate Mean'.hardcoded),
        actions: const [],
      );
    } else {
      return AppBar(
        title: Text('Calculate Mean'.hardcoded),
        actions: const [],
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
