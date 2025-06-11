import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/core/extension/for_context.dart';
import 'package:marketplace/core/services/system_bar_service/system_bar.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/features/cart/presentation/controller/bloc/cart_bloc.dart';
import 'package:marketplace/features/common/widgets/w_nav_bar.dart';

class MainView extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainView({super.key, required this.navigationShell});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  @override
  void initState() {
    SystemBar.setOverlayStyle();
    context.read<CartBloc>().add(GetCartEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          widget.navigationShell,
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: he(90),
              width: context.w,
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: ColoredBox(
                        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                        child: WNawBar(
                          navigationShell: widget.navigationShell,
                        ),
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
