import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/core/extension/svg_extension.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';
import 'package:marketplace/features/common/widgets/w_scale_animation.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final BoxBorder? border;
  final double borderRadius;
  final Widget? child;
  final Color? disabledColor;
  final bool isDisabled;
  final bool isLoading;
  final String? icon;
  final double? scaleValue;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;

  const CustomButton({
    required this.onTap,
    this.child,
    this.text = '',
    this.textColor,
    this.color,
    this.borderRadius = 16,
    this.disabledColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.border,
    this.scaleValue,
    this.shadow,
    this.gradient,
    super.key,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      scaleValue: scaleValue ?? 0.98,
      onTap: () {
        if (!(isLoading || isDisabled)) {
          onTap();
        }
      },
      isDisabled: isDisabled,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height ?? he(62),
        margin: margin,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled
              ? (disabledColor ?? AppColors.primaryColor)
              : color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          boxShadow: shadow,
        ),
        child: isLoading
            ? Center(
                child: CupertinoActivityIndicator(
                    color: textColor ?? AppColors.primaryColor))
            : AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    height: 1.36,
                    color: isDisabled ? AppColors.primaryColor : AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Unbounded'),
                child: child ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null) ...[
                          icon!.svg(color: Color(0xffffffff)),
                          horizontalSpace(10),
                        ],
                        Text(
                          text,
                          style: textStyle ??
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: textColor ??
                                        (isDisabled
                                            ? AppColors.cardColor
                                            : AppColors.cardColor),
                                    height: 1.4,
                                    fontFamily: 'Unbounded',
                                    fontWeight: FontWeight.w600,
                                  ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    )),
      ),
    );
  }
}
