import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/core/extension/for_context.dart';
import 'package:marketplace/core/services/hive_service/product_hive_service.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/features/common/widgets/w_nav_bar.dart';
import 'package:marketplace/features/home/domain/entity/product_entity.dart';
import 'package:marketplace/features/home/presentation/controller/home_controller.dart';
import 'package:marketplace/features/home/presentation/widgets/product_card.dart';
import 'package:marketplace/features/home/presentation/widgets/product_detail_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key,});

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: (context.w - wi(44))/244 * 0.5,
      ),
      itemCount: controller.productList.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(
          left: wi(16),
          right: wi(16),
          top: MediaQuery.paddingOf(context).top + he(16),
          bottom: he(100)
      ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return GestureDetector(
          onTap: ()async{
            final ProductHiveService service = ProductHiveService();
            List<ProductEntity> products = await service.getProductList();
            ProductEntity product = controller.productList[index];
            for(ProductEntity item in products){
              if(item.id == product.id){
                product = item;
                break;
              }
            }
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useRootNavigator: true,
              enableDrag: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16)
                  )
              ),
              backgroundColor: AppColors.cardColor,
              constraints: BoxConstraints(maxHeight: context.h - he(48)),
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom, top: he(10)),
                child: ProductDetailBottomSheet(
                  product: product,
                ),
              ),
            );
          },
          child: ProductCard(
            product: controller.productList[index],
          ),
        );
      },
    );
  }
}
