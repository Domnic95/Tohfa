import 'package:flutter/material.dart';

/// A widget to display rating as assigned using [rating] property.
///
/// This is a read only version of [RatingBar].
///
/// Use [RatingBar], if interactive version is required.
/// i.e. if user input is required.
class RatingBarIndicator extends StatefulWidget {
  RatingBarIndicator({
    required this.itemBuilder,
    this.textDirection,
    this.unratedColor,
    this.direction = Axis.horizontal,
    this.itemCount = 5,
    this.itemPadding = EdgeInsets.zero,
    this.itemSize = 40.0,
    this.physics = const NeverScrollableScrollPhysics(),
    this.rating = 0.0,
    this.unratedWidget, // Add this new parameter
  });

  final IndexedWidgetBuilder itemBuilder;
  final TextDirection? textDirection;
  final Color? unratedColor;
  final Axis direction;
  final int itemCount;
  final EdgeInsets itemPadding;
  final double itemSize;
  final ScrollPhysics physics;
  final double rating;
  final Widget? unratedWidget; // New parameter for custom unrated appearance

  @override
  _RatingBarIndicatorState createState() => _RatingBarIndicatorState();
}

class _RatingBarIndicatorState extends State<RatingBarIndicator> {
  double _ratingFraction = 0.0;
  int _ratingNumber = 0;
  bool _isRTL = false;

  @override
  void initState() {
    super.initState();
    _updateRatingValues();
  }

  void _updateRatingValues() {
    _ratingNumber = widget.rating.truncate() + 1;
    _ratingFraction = widget.rating - _ratingNumber + 1;
  }

  @override
  Widget build(BuildContext context) {
    final textDirection = widget.textDirection ?? Directionality.of(context);
    _isRTL = textDirection == TextDirection.rtl;
    _updateRatingValues();

    return SingleChildScrollView(
      scrollDirection: widget.direction,
      physics: widget.physics,
      child: widget.direction == Axis.horizontal
          ? Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: textDirection,
        children: _children,
      )
          : Column(
        mainAxisSize: MainAxisSize.min,
        textDirection: textDirection,
        children: _children,
      ),
    );
  }

  List<Widget> get _children {
    return List.generate(
      widget.itemCount,
          (index) {
        if (widget.textDirection != null) {
          if (widget.textDirection == TextDirection.rtl &&
              Directionality.of(context) != TextDirection.rtl) {
            return Transform(
              transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
              alignment: Alignment.center,
              transformHitTests: false,
              child: _buildItems(index),
            );
          }
        }
        return _buildItems(index);
      },
    );
  }

  Widget _buildItems(int index) {
    return Padding(
      padding: widget.itemPadding,
      child: SizedBox(
        width: widget.itemSize,
        height: widget.itemSize,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Show either the custom unrated widget or the default with border
            if (index + 1 >= _ratingNumber)
              widget.unratedWidget ?? _buildOutlinedStar(index),

            // Show filled star for selected items
            if (index + 1 < _ratingNumber)
              FittedBox(
                fit: BoxFit.contain,
                child: widget.itemBuilder(context, index),
              ),

            // Handle partially filled star
            if (index + 1 == _ratingNumber)
              _isRTL
                  ? FittedBox(
                fit: BoxFit.contain,
                child: ClipRect(
                  clipper: _IndicatorClipper(
                    ratingFraction: _ratingFraction,
                    rtlMode: _isRTL,
                  ),
                  child: widget.itemBuilder(context, index),
                ),
              )
                  : FittedBox(
                fit: BoxFit.contain,
                child: ClipRect(
                  clipper: _IndicatorClipper(
                    ratingFraction: _ratingFraction,
                  ),
                  child: widget.itemBuilder(context, index),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Helper method to create outlined star
  Widget _buildOutlinedStar(int index) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Icon(
        Icons.star_border, // Use star_border for outline
        color: widget.unratedColor ?? Theme.of(context).disabledColor,
      ),
    );
  }
}
class _IndicatorClipper extends CustomClipper<Rect> {
  _IndicatorClipper({
    required this.ratingFraction,
    this.rtlMode = false,
  });

  final double ratingFraction;
  final bool rtlMode;

  @override
  Rect getClip(Size size) {
    return rtlMode
        ? Rect.fromLTRB(
            size.width - size.width * ratingFraction,
            0.0,
            size.width,
            size.height,
          )
        : Rect.fromLTRB(
            0.0,
            0.0,
            size.width * ratingFraction,
            size.height,
          );
  }

  @override
  bool shouldReclip(_IndicatorClipper oldClipper) {
    return ratingFraction != oldClipper.ratingFraction ||
        rtlMode != oldClipper.rtlMode;
  }
}
