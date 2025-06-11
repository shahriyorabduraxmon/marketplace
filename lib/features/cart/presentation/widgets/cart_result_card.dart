import 'package:flutter/material.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/assets/app_icons.dart';
import 'package:marketplace/core/extension/price_extention.dart';
import 'package:marketplace/core/extension/svg_extension.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';
import 'package:marketplace/features/common/widgets/custom_button.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';

class CartResultCard extends StatelessWidget {
  const CartResultCard({super.key, required this.productCount, required this.productPrice, required this.totalPrice, required this.discount});

  final int productCount;
  final double productPrice;
  final double totalPrice;
  final double discount;

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
                  "Product, $productCount th",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
                  ),
                ),
                Text(
                  "${productPrice.priceFormat} so'm",
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
                  "${discount.priceFormat} so'm",
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
                  "${totalPrice.priceFormat} so'm",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13
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
