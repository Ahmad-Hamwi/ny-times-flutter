import 'dart:math';

import 'package:flutter/material.dart';

class RemoteImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String? src;
  final String? placeholder;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;

  const RemoteImage({
    Key? key,
    required this.src,
    this.placeholder,
    this.height,
    this.width,
    this.fit,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(4)),
      child: src != null
          ? Image.network(
              src!,
              height: height,
              width: width,
              fit: fit,
              errorBuilder: (_, __, ___) => placeholder != null
                  ? Image.asset(
                      placeholder!,
                      height: height,
                      width: width,
                    )
                  : SizedBox(
                      height: height,
                      width: width,
                    ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return SizedBox(
                  height: height,
                  width: width,
                  child: Center(
                    child: SizedBox(
                      height: height != null ? height! / 4 : null,
                      width: width != null ? width! / 4 : null,
                      child: CircularProgressIndicator(
                        strokeWidth: width != null && height != null
                            ? [width!, height!].reduce(min) / 24
                            : 2,
                      ),
                    ),
                  ),
                );
              },
            )
          : placeholder != null
              ? Image.asset(
                  placeholder!,
                  height: height,
                  width: width,
                )
              : SizedBox(
                  height: height,
                  width: width,
                ),
    );
  }
}
