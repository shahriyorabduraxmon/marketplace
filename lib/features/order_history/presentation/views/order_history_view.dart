import 'package:flutter/material.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';
import 'package:marketplace/features/order_history/presentation/widgets/order_history_card.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        toolbarHeight: he(56),
        backgroundColor: AppColors.cardColor,
        centerTitle: true,
        title: Text(
          "Order History",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.w800,
              fontSize: 18),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(
            left: wi(12),
            right: wi(12),
            top: MediaQuery.paddingOf(context).top,
            bottom: he(100)),
        itemCount: 3,
        separatorBuilder: (context, index) {
          return verticalSpace(he(16));
        },
        itemBuilder: (context, index) {
          return OrderHistoryCard();
        },
      ),
    );
  }
}
