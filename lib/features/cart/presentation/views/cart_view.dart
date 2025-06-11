import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/assets/app_icons.dart';
import 'package:marketplace/core/constants/constants.dart';
import 'package:marketplace/core/extension/svg_extension.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';
import 'package:marketplace/features/cart/presentation/controller/bloc/cart_bloc.dart';
import 'package:marketplace/features/cart/presentation/widgets/cart_card.dart';
import 'package:marketplace/features/cart/presentation/widgets/cart_result_card.dart';
import 'package:marketplace/features/common/show_message/show_mesasge.dart';
import 'package:marketplace/features/common/widgets/custom_button.dart';
import 'package:marketplace/features/common/widgets/custom_empty_page.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        toolbarHeight: he(56),
        leadingWidth: 0,
        backgroundColor: AppColors.cardColor,
        centerTitle: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.w800,
              fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CartBloc>().add(DeleteCartEvent());
              ShowMessage.showErrorMessage(context, "Cart cleared");
            },
            icon: AppIcons.trash.svg(
              height: wi(20),
              width: wi(20),
              color: AppColors.textColor,
            ),
          )
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if(state.status == Status.LOADING){
            return Center(
              child: CupertinoActivityIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
          if(state.status != Status.LOADING && state.products.isEmpty){
            return CustomEmptyPage(
                title: 'Nothing found',
                description: "You have not added any products to your cart yet!"
            );
          }
          return ListView.separated(
            padding: EdgeInsets.only(
                left: wi(12),
                right: wi(12),
                top: MediaQuery.paddingOf(context).top + he(16),
                bottom: he(16)),
            shrinkWrap: true,
            itemCount: state.products.length + 1,
            separatorBuilder: (context, index) {
              return verticalSpace(he(16));
            },
            itemBuilder: (context, index) {
              if (index == state.products.length) {
                return CartResultCard(
                  productCount: state.productCounts,
                  productPrice: state.totalPrice,
                  discount: 0,
                  totalPrice: state.totalPrice - 0,
                );
              }
              return CartCard(
                  product: state.products[index]
              );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state){
          if(state.products.isEmpty){
            return SizedBox.shrink();
          }
          return Padding(
            padding: EdgeInsets.only(
              left: wi(12),
              right: wi(12),
              top: he(16),
              bottom: he(100),
            ),
            child: CustomButton(
              onTap: (){
                ShowMessage.showSuccessMessage(context, "Order created successfully.");
                context.read<CartBloc>().add(DeleteCartEvent());
              },
              text: 'Ordering',
            ),
          );
        },
      ),
    );
  }
}
