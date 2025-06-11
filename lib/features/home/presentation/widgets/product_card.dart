import 'package:flutter/material.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/core/extension/price_extention.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: wi(12),
          vertical: he(16),
        ),
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: he(120),
              width: wi(140),
            ),
            verticalSpace(8),
            Expanded(
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpace(8),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: he(8)
                ),
                child: Center(
                  child: Text(
                    "${product.price.priceFormat} so'm",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
