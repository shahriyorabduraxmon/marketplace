import 'package:flutter/material.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/assets/app_images.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';

class CustomEmptyPage extends StatelessWidget {
  const CustomEmptyPage(
      {super.key,
      required this.title,
      required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wi(30)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.empty,
              height: he(136),
              width: wi(156),
            ),
            verticalSpace(10),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
              ),
              maxLines: 4,
              textAlign: TextAlign.center,
            ),
            verticalSpace(5),
            Text(
              description,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.2),
              maxLines: 4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
