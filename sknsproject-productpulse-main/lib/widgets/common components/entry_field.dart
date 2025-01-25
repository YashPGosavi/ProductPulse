import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final String? hint;
  final IconData? prefixIcon;
  final Color? color;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? readOnly;
  final TextAlign? textAlign;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final Function? onTap;
  final IconData? suffix;

  const EntryField({
    super.key,
    this.hint,
    this.prefixIcon,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.onTap,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null
            ? Text('\n${label!}\n',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: const Color(0xff808080), fontSize: 15))
            : const SizedBox.shrink(),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                initialValue: initialValue,
                readOnly: readOnly ?? false,
                maxLines: maxLines ?? 1,
                textAlign: textAlign ?? TextAlign.left,
                keyboardType: textInputType,
                decoration: InputDecoration(
                  prefixIcon: prefixIcon != null
                      ? Icon(
                          prefixIcon,
                          color: Colors.grey,
                          size: 18.5,
                        )
                      : null,
                  suffixIcon: Icon(suffixIcon),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 15),
                  hintText: hint,
                  filled: true,
                  fillColor: color ?? Theme.of(context).colorScheme.background,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
                ),
                onTap: onTap as void Function()?,
              ),
            ),
            if (suffix != null)
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsetsDirectional.only(start: 8),
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    suffix,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}
