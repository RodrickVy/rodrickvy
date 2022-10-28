import 'package:flutter/material.dart';

class ImageFader extends StatelessWidget {
  final String image;
  final Curve animationCurve;
  final Duration duration;
  final double? width;
  final double? height;
  final BoxFit fit;
final Color? color;
  const ImageFader({
    Key? key,
    required this.image,
    this.color,
    this.fit = BoxFit.cover,
    this.animationCurve = Curves.easeOut,
    this.duration = const Duration(seconds: 1),
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      filterQuality: FilterQuality.high,
      color: color,
      frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          child: child,
          opacity: frame == null ? 0 : 1,
          duration: duration,
          curve: animationCurve,
        );
      },
      width: width,
      height: height,
      fit: fit,
    );
  }
}
