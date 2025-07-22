

import '../../export.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? borderColor;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry? alignment;
final double? height;
  const CustomCard(
      {super.key,
        required this.child,
        this.margin,
        this.padding,
        this.borderColor,
        this.color,
        this.borderRadius, this.decoration, this.alignment,this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height:height ,
        margin: margin,
        padding: padding,
        alignment: alignment??Alignment.center,
        decoration:decoration?? ShapeDecoration(
          color: color ?? Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color:borderColor ?? Colors.transparent, width: borderColor != null ? 2 : 0),
            borderRadius: borderRadius ?? BorderRadius.circular(getSize(16)),
          ),
          shadows:  [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 24,
              offset: const Offset(0, 12),
              spreadRadius: 0,
            )
          ],
        ),
        child: child);
  }
}
