import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/assets/app_icons.dart';
import 'package:marketplace/core/extension/price_extention.dart';
import 'package:marketplace/core/extension/svg_extension.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';
import 'package:marketplace/features/cart/presentation/controller/bloc/cart_bloc.dart';
import 'package:marketplace/features/common/widgets/custom_button.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';
import 'package:vibration/vibration.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.product});

  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(wi(12)),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Image.asset(
                product.image,
                height: wi(56),
                width: wi(56),
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "${product.price.priceFormat} so'm",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15
                    ),
                  )

                ],
              ),
            ),
            horizontalSpace(8),
            CustomButton(
              onTap: ()async{
                if(product.cartCount == 1){
                  context.read<CartBloc>().add(DeleteCartItemEvent(product: product));
                } else {
                  context.read<CartBloc>().add(UpdateCartItemEvent(count: product.cartCount - 1, product: product));
                }
                if (await Vibration
                    .hasCustomVibrationsSupport()) {
                Vibration.vibrate(
                pattern: [0, 1],
                intensities: [0, 135],
                duration: 1,
                );
                }
              },
              height: wi(36),
              width: wi(36),
              color: AppColors.bgColor,
              borderRadius: 12,
              child: AppIcons.minus.svg(
                height: wi(20),
                width: wi(20),
                color: AppColors.textColor,
              )
            ),
            horizontalSpace(2),
            SizedBox(
              height: he(20),
              width: wi(32),
              child: Center(
                child: Text(
                  product.cartCount.toString(),
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
            horizontalSpace(2),
            CustomButton(
              onTap: ()async{
                context.read<CartBloc>().add(UpdateCartItemEvent(count: product.cartCount + 1, product: product));
                if (await Vibration
                    .hasCustomVibrationsSupport()) {
                Vibration.vibrate(
                pattern: [0, 1],
                intensities: [0, 135],
                duration: 1,
                );
                }
              },
              height: wi(36),
              width: wi(36),
              color: AppColors.bgColor,
              borderRadius: 12,
              child: AppIcons.plus.svg(
                height: wi(20),
                width: wi(20),
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
