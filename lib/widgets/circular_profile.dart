import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class OuterCircularProfile extends StatelessWidget {
  const OuterCircularProfile({
    Key? key,
    required this.radius,
    this.image,
    this.innerRadius = 5,
  }) : super(key: key);

  final double radius;
  final ImageProvider<Object>? image;
  final double innerRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(radius * .06),
      width: radius,
      height: radius,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColor.secondaryColor.withOpacity(.5),
          width: 1,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: AppColor.primaryColor.withOpacity(.12),
        radius: 40,
        backgroundImage: image,
      ),
    );
  }
}

class CircularProfile extends StatelessWidget {
  const CircularProfile({
    Key? key,
    this.image,
    this.backgroundColor,
    this.innerBorderColor,
    this.borderThickness,
    this.radius = 40,
    this.onTap,
    this.showShadow = true,
    this.showInnerBorder = true,
    this.customShadow,
    this.child,
  }) : super(key: key);
  final ImageProvider<Object>? image;
  final Color? backgroundColor;
  final Color? innerBorderColor;
  final double? borderThickness;
  final double radius;
  final VoidCallback? onTap;
  final bool showShadow;
  final bool showInnerBorder;
  final List<BoxShadow>? customShadow;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? Theme.of(context).primaryColor,
          boxShadow: showShadow
              ? customShadow ??
                  [
                    BoxShadow(
                      color: backgroundColor ??
                          Theme.of(context).primaryColor.withOpacity(0.5),
                      spreadRadius: radius * 0.1,
                      blurRadius: radius * 0.3,
                      offset: const Offset(0, 0),
                    ),
                  ]
              : null,
          image: image != null
              ? DecorationImage(
                  image: image!,
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: showInnerBorder
            ? Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: innerBorderColor ?? Colors.white.withOpacity(0.5),
                    width: borderThickness ?? radius * 0.1,
                  ),
                ),
                child: FittedBox(child: child),
              )
            : null,
      ),
    );
  }
}
