import 'package:marketplace/core/navigation/custom_transition_page.dart';
import 'package:marketplace/core/navigation/routs_contact.dart';
import 'package:marketplace/features/cart/presentation/views/cart_view.dart';
import 'package:marketplace/features/home/presentation/views/home_view.dart';
import 'package:marketplace/features/main/presentation/views/main_view.dart';
import 'package:marketplace/features/map/presentation/views/map_view.dart';
import 'package:marketplace/features/order_history/presentation/views/order_history_view.dart';
import 'package:marketplace/features/personal_information/presentation/views/personal_information_view.dart';
import 'package:marketplace/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

sealed class AppRouts {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        name: RoutsContact.orderHistory,
        path: '/order_history',
        pageBuilder: (context, state) => customTransitionPage(
          context: context,
          state: state,
          child: const OrderHistoryView(),
        ),
      ),
      GoRoute(
        name: RoutsContact.personalInformation,
        path: '/personal_information',
        pageBuilder: (context, state) => customTransitionPage(
          context: context,
          state: state,
          child: const PersonalInformationView(),
        ),
      ),
      mainView,
    ],
  );

  static StatefulShellRoute mainView = StatefulShellRoute.indexedStack(
    pageBuilder: (context, state, navigationShell) => customTransitionPage(
      context: context,
      state: state,
      child: MainView(navigationShell: navigationShell),
    ),
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: RoutsContact.home,
            path: '/home',
            pageBuilder: (context, state) => customTransitionPage(
              context: context,
              state: state,
              child: HomeView(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: RoutsContact.cart,
            path: '/catcartalog',
            pageBuilder: (context, state) => customTransitionPage(
              context: context,
              state: state,
              child: const CartView(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: RoutsContact.map,
            path: '/map',
            pageBuilder: (context, state) => customTransitionPage(
              context: context,
              state: state,
              child: const MapView(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: RoutsContact.profile,
            path: '/profile',
            pageBuilder: (context, state) => customTransitionPage(
              context: context,
              state: state,
              child: const ProfileView(),
            ),
          ),
        ],
      ),
    ],
  );
}
