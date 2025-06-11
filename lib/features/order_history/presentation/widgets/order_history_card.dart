import 'package:flutter/material.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({super.key});


  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(wi(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product, 12 th",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),
                ),
                Text(
                  "114 000 so'm",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),
                )
              ],
            ),
            verticalSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),
                ),
                Text(
                  "0 so'm",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: he(16)
              ),
              child: Divider(
                height: he(1),
                color: AppColors.bgColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total to be paid",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),
                ),
                Text(
                  "114 000 so'm",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),
                )
              ],
            ),
            verticalSpace(8),
            Row(
              children: [
                Spacer(),
                Text(
                  "22:48 12.06.2025",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
