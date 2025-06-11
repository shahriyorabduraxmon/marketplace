import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/assets/app_icons.dart';
import 'package:marketplace/core/extension/for_context.dart';
import 'package:marketplace/core/extension/price_extention.dart';
import 'package:marketplace/core/extension/svg_extension.dart';
import 'package:marketplace/core/services/hive_service/product_hive_service.dart';
import 'package:marketplace/core/services/local_storage/storage_keys.dart';
import 'package:marketplace/core/services/local_storage/storage_repository.dart';
import 'package:marketplace/core/utils/log_service.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';
import 'package:marketplace/features/cart/presentation/controller/bloc/cart_bloc.dart';
import 'package:marketplace/features/common/show_message/show_mesasge.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';
import 'package:vibration/vibration.dart';

class ProductDetailBottomSheet extends StatelessWidget {
  ProductDetailBottomSheet({super.key, required this.product});

  final ProductEntity product;
  final GlobalKey widgetKey = GlobalKey();
  final GlobalKey<CartIconKey> addKey = GlobalKey<CartIconKey>();
  final ProductHiveService service = ProductHiveService();

  void onAnimation(GlobalKey _widgetKey) async {
    if (_widgetKey.currentContext != null) {
      await runAddToCartAnimation(_widgetKey);
    } else {
      Log.w("AddToCartAnimation: context null => widgetKey: $widgetKey");
    }
  }

  Function(GlobalKey) runAddToCartAnimation = (GlobalKey) {};

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> productCountCtr = ValueNotifier<int>(product.cartCount);
    return AddToCartAnimation(
      height: 10,
      width: 10,
      dragAnimation: const DragToCartAnimationOptions(
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInBack,
      ),
      jumpAnimation: const JumpAnimationOptions(
        duration: Duration(milliseconds: 0),
        curve: Curves.easeOut,
      ),
      cartKey: addKey,
      createAddToCartAnimation: (runAddToCartAnimation) {
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Padding(
        padding: EdgeInsets.all(wi(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: widgetKey,
              child: Image.asset(
                product.image,
                height: context.w,
                width: context.w,
              ),
            ),
            verticalSpace(16),
            Text(
              product.name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
            Text(
              product.category,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            verticalSpace(4),
            Text(
              "${product.price.priceFormat} so'm",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
            verticalSpace(4),
            Expanded(
              child: Text(
                product.description,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            verticalSpace(8),
            GestureDetector(
              onTap: () async {
                if (StorageRepository.getString(StorageKeys.firstName,
                        defValue: '')
                    .isNotEmpty) {
                  if (productCountCtr.value == 0) {
                    context
                        .read<CartBloc>()
                        .add(AddCartItemEvent(product: product));
                    onAnimation(widgetKey);
                    productCountCtr.value = 1;
                  }
                } else {
                  ShowMessage.showErrorMessage(
                      context, "Enter your name first.");
                  context.pop();
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
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: he(48),
                padding: EdgeInsets.symmetric(
                  horizontal: wi(16),
                ),
                width: context.w - wi(24),
                child: ValueListenableBuilder(
                    valueListenable: productCountCtr,
                    builder: (context, count, _) {
                      return Row(
                        children: [
                          if (count > 0)
                            GestureDetector(
                              onTap: () async {
                                if (count == 1) {
                                  context.read<CartBloc>().add(
                                      DeleteCartItemEvent(product: product));
                                  productCountCtr.value = count - 1;
                                } else {
                                  context.read<CartBloc>().add(
                                      UpdateCartItemEvent(
                                          count: count - 1, product: product));
                                  productCountCtr.value = count - 1;
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
                              child: AppIcons.minus.svg(
                                  height: wi(32),
                                  width: wi(32),
                                  color: AppColors.cardColor),
                            ),
                          Expanded(
                            child: AddToCartIcon(
                              key: addKey,
                              badgeOptions: const BadgeOptions(active: false),
                              icon: GestureDetector(
                                child: Text(count > 0 ? "$count" : "Add Cart",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          color: AppColors.cardColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        )),
                              ),
                            ),
                          ),
                          if (count > 0)
                            GestureDetector(
                              onTap: () async {
                                context.read<CartBloc>().add(
                                    UpdateCartItemEvent(
                                        count: count + 1, product: product));
                                onAnimation(widgetKey);
                                productCountCtr.value = count + 1;
                                if (await Vibration
                                    .hasCustomVibrationsSupport()) {
                                Vibration.vibrate(
                                pattern: [0, 1],
                                intensities: [0, 255],
                                duration: 1,
                                );
                                }
                              },
                              child: AppIcons.plus.svg(
                                  height: wi(32),
                                  width: wi(32),
                                  color: AppColors.cardColor),
                            ),
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
