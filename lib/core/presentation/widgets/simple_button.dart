import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/ui_constants.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    this.isFilled = false,
    this.isLoading = false,
    this.width,
    this.height = 48,
    required this.buttonLabel,
    this.label,
    this.prefixWidget,
    this.suffixWidget,
    this.borderColor,
    this.textColor,
    this.isExpanded = true,
    this.alignment,
    this.handleTap,
    this.fillColor,
    this.fontSize,
    this.splashColor,
    this.progressColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.isButtonDisabled,
  });
  final String buttonLabel;
  final Text? label;
  final double? width;
  final bool isExpanded;
  final double? height;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color? textColor;
  final bool isFilled;
  final Color? borderColor;
  final Color? splashColor;
  final bool? isLoading;
  final Color? progressColor;
  final MainAxisAlignment? alignment;
  final Color? fillColor;
  final double? fontSize;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool? isButtonDisabled;
  // final VoidCallback callback;
  final void Function()? handleTap;

  @override
  Widget build(BuildContext context) {
    Color buttonTextColor = textColor != null ? textColor! : AppColors.red;
    Color? backgroundColor = (isButtonDisabled != null && isButtonDisabled!)
        ? AppColors.whiteShade
        : isFilled == true
            ? (fillColor ?? AppColors.red)
            : null;
    return ClipRRect(
      borderRadius: BorderRadius.circular(UIConstants.minBorderRadius),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          highlightColor: AppColors.white.withOpacity(0.2),
          splashColor: splashColor ?? AppColors.white.withOpacity(0.2),
          onTap: (isButtonDisabled != null && isButtonDisabled!)
              ? null
              : handleTap,
          child: Container(
            // color: Colors.yellow.shade600,
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: isFilled == false
                  ? Border.all(
                      color: borderColor != null ? borderColor! : AppColors.red,
                    )
                  : null,
              // color: (isButtonDisabled != null && isButtonDisabled!)
              //     ? AppColors.whiteShade
              //     : isFilled == true
              //         ? (fillColor ?? AppColors.red)
              //         : null,
              borderRadius: BorderRadius.circular(UIConstants.minBorderRadius),
            ),
            child: DefaultTextStyle(
              style: TextStyle(
                  color: isFilled == true ? Colors.white : buttonTextColor),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding ?? UIConstants.padding,
                    vertical: verticalPadding ?? 0),
                child: Row(
                  mainAxisSize:
                      isExpanded ? MainAxisSize.max : MainAxisSize.min,
                  mainAxisAlignment: alignment ?? MainAxisAlignment.start,
                  children: [
                    if (prefixWidget != null) prefixWidget!,
                    isLoading != null && !isLoading!
                        ? label ??
                            Text(
                              buttonLabel,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: fontSize,
                                      color: textColor ??
                                          (isFilled ? AppColors.white : null)),
                            )
                        : SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                              strokeWidth: 1,
                            ),
                          ),
                    if (suffixWidget != null) suffixWidget!
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class FilledCustomButton extends StatelessWidget {
//   final String buttonLabel;
//   final Widget? prefixWidget;
//   const FilledCustomButton({
//     super.key,
//     required this.buttonLabel,
//     this.prefixWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FilledButton(
//       style: FilledButton.styleFrom(
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(4))),
//           minimumSize: const Size.fromHeight(48)),
//       onPressed: () {},
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           if (prefixWidget != null) prefixWidget!,
//           Text(buttonLabel, style: const TextStyle(fontSize: 16))
//         ],
//       ),
//     );
//   }
// }

// class OutlinedCustomButton extends StatelessWidget {
//   final String buttonLabel;
//   final bool? isExpanded;
//   final Widget? prefixWidget;
//   final Widget? suffixWidget;
//   final Color? textColor;
//   const OutlinedCustomButton(
//       {super.key,
//       this.isExpanded,
//       required this.buttonLabel,
//       this.prefixWidget,
//       this.suffixWidget,
//       this.textColor});

//   @override
//   Widget build(BuildContext context) {
//     Size? getSize() {
//       if (isExpanded == true) {
//         return const Size.fromHeight(48);
//       } else {
//         return null;
//       }
//     }

//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(4))),
//           minimumSize: getSize(),
//           side: BorderSide(color: Theme.of(context).colorScheme.primary)),
//       onPressed: () {},
//       child: Row(
//         mainAxisAlignment: (prefixWidget != null || suffixWidget != null)
//             ? MainAxisAlignment.spaceBetween
//             : MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           if (prefixWidget != null) prefixWidget!,
//           Text(buttonLabel, style: TextStyle(fontSize: 16, color: textColor)),
//           if (suffixWidget != null) suffixWidget! else SizedBox()
//         ],
//       ),
//     );
//   }
// }

// class Button extends ButtonStyleButton {
//   final String type;
//   const Button(
//       {super.key,
//       required this.type,
//       required super.onPressed,
//       super.onLongPress,
//       super.onHover,
//       super.onFocusChange,
//       super.style,
//       super.focusNode,
//       super.autofocus = false,
//       super.clipBehavior = Clip.none,
//       required super.child});

//   @override
//   ButtonStyle defaultStyleOf(BuildContext context) {
//     return const ButtonStyle(
//         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(4)))),
//         minimumSize: MaterialStatePropertyAll(Size.fromHeight(48)));
//   }

//   @override
//   ButtonStyle? themeStyleOf(BuildContext context) {
//     return type == "outline"
//         ? FilledButtonTheme.of(context).style
//         : OutlinedButtonTheme.of(context).style;
//   }
// }
