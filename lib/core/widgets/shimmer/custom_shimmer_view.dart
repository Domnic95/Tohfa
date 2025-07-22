
import 'package:demo/core/widgets/shimmer/shimmer.dart';

import '../../../export.dart';

class CustomShimmerView extends StatelessWidget {
  final Widget widget;

  const CustomShimmerView({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.2),
        period: const Duration(seconds: 2),
        highlightColor: Colors.white24,
        enabled: true,
        child: widget,
    );
  }
}


class CustomShimmerText extends StatelessWidget {
  final double? width;
  final double? height;
  const CustomShimmerText({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      width:getHorizontalSize(width?? 120),
      height: getVerticalSize(height??16),
    );
  }
}
