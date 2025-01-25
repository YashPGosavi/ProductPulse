import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final double? iconGap;
  final Function? onTap;
  final Color? color;
  final Color? textColor;
  final double? padding;
  final double? radius;
  final Widget? trailing;
  final double? textSize;

  const CustomButton({
    super.key,
    this.label,
    this.icon,
    this.iconGap,
    this.onTap,
    this.color,
    this.textColor,
    this.padding,
    this.radius,
    this.trailing,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8),
          color: color,
        ),
        padding: EdgeInsets.all(padding ?? (icon != null ? 16.0 : 18.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            icon != null
                ? SizedBox(width: iconGap ?? 20)
                : const SizedBox.shrink(),
            Text(
              label!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: textColor ?? Colors.black, fontSize: textSize ?? 16.7),
            ),
            trailing != null ? const Spacer() : const SizedBox.shrink(),
            trailing ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
