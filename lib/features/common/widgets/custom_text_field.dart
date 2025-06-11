import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace/assets/app_colors.dart';
import 'package:marketplace/core/utils/size_config.dart';
import 'package:marketplace/core/utils/space.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final bool isDisabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final double? width;
  final double? contentPadding;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? obscureText;
  final List<TextInputFormatter> formatters;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final bool isPhone;
  final Color? labelColor;

  final int? maxLines;
  const CustomTextField({
    super.key,
    this.label,
    this.labelColor,
    this.height,
    this.width,
    this.contentPadding,
    this.keyboardType,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.isDisabled = false,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.maxLength,
    this.obscureText,
    this.validator,
    this.autovalidateMode,
    this.formatters = const [],
    this.isPhone = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with WidgetsBindingObserver {
  late ValueNotifier<bool> isFilled;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    isFilled = ValueNotifier(widget.controller.text.isNotEmpty);
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {});
    });

    widget.controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(widget.controller.text);
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    isFilled.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  double _keyboardInset = 0.0;

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;

    // Faqat klaviatura yopilganda unfocus qilish
    if (_keyboardInset > 0.0 && bottomInset == 0.0) {
      _focusNode.unfocus();
    }

    _keyboardInset = bottomInset;
  }

  @override
  Widget build(BuildContext context) {
    bool isDisabled = widget.isDisabled;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label ?? '',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: isDisabled
                  ? widget.labelColor ?? AppColors.textColor
                  : widget.labelColor ?? AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          verticalSpace(5),
        ],
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: ValueListenableBuilder<bool>(
            valueListenable: isFilled,
            builder: (context, filled, child) {
              return TextFormField(
                readOnly: isDisabled,
                maxLines: widget.maxLines,
                maxLength: widget.maxLength,
                controller: widget.controller,
                obscureText: widget.obscureText ?? false,
                focusNode: _focusNode,
                onChanged: widget.onChanged,
                keyboardType: widget.keyboardType,
                onEditingComplete: widget.onEditingComplete,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
                inputFormatters: widget.formatters,
                validator: widget.validator,
                autovalidateMode: widget.autovalidateMode,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                  fontSize: 16
                    ),
                decoration: InputDecoration(
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  hintText: widget.hint,
                  filled: true,
                  fillColor: AppColors.cardColor,
                  counterText: '',
                  hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                        fontSize: 14
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: widget.contentPadding ?? he(17),
                    horizontal: wi(15),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: filled ? AppColors.primaryColor : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: filled ? AppColors.primaryColor : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: widget.isDisabled
                          ? AppColors.transparent
                          : AppColors.primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
