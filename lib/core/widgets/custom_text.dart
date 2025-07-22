import '../../export.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;

  const CustomText({super.key,
    required this.text,
    this.style,
    this.maxLines,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.trim().isEmpty?"N/A":text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: style ?? CustomTextStyle.bodyText.copyWith(
        fontSize: getSize(14),
      ),
    );
  }
}
