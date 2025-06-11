import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/assets/app_icons.dart';
import 'package:marketplace/core/extension/svg_extension.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/features/common/models/nav_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WNawBar extends StatefulWidget {
  const WNawBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<WNawBar> createState() => _WNawBarState();
}

class _WNawBarState extends State<WNawBar> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final List<ValueNotifier<bool>> listController = [];

  final List<NavbarModel> list = [
    NavbarModel(name: "Main", icon: AppIcons.home),
    NavbarModel(name: "Cart ", icon: AppIcons.cart),
    NavbarModel(name: "Map", icon: AppIcons.map),
    NavbarModel(name: "Profile", icon: AppIcons.profile),
  ];

  @override
  void initState() {
    tabController = TabController(length: list.length, vsync: this, initialIndex: 0);
    for (int i = 0; i <= list.length - 1; i++) {
      listController.add(ValueNotifier(i == 0 ? true : false));
    }
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.transparent,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.cardColor.withOpacity(0.2),
            AppColors.cardColor.withOpacity(0.001),
          ]
        )
      ),
      height: he(90),
      child: TabBar(
        dividerColor: Colors.transparent,
        controller: tabController,
        unselectedLabelColor: AppColors.navBarColor,
        indicatorColor: Colors.transparent,
        labelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: AppColors.primaryColor,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: AppColors.navBarColor.withOpacity(0.7),
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        labelColor: AppColors.primaryColor,
        isScrollable: false,
        onTap: (index){
          for(int i = 0; i<= listController.length -1; i++){
            listController[i].value = i==index;
          }
          widget.navigationShell.goBranch(index);
        },
        tabs: List.generate(list.length, (index) {
          return ValueListenableBuilder(
              valueListenable: listController[index],
              builder: (context, isActive, _) {
                return Tab(
                  text: list[index].name,
                  icon: list[index].icon.svg(
                    color: isActive ? AppColors.primaryColor : AppColors.navBarColor
                  ),
                );
              }
          );
        }),
      ),
    );
  }
}
