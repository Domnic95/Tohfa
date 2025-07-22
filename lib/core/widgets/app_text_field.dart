import '../../export.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final void Function()? onTextFieldTap;
  final bool? isRequired;
  final bool? readOnly;
  final bool? withOutLabel;
  final bool? obscureText;
  final TapRegionCallback? onTapOutside;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? customLabel;
  final Color? backGroundColor;
  final String labelText;
  final String? errorText;
  final Widget? subTitle;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? padding;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;

  const AppTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.maxLines,
      this.onChanged,
      this.focusNode,
      this.onTextFieldTap,
      this.readOnly,
      this.maxLength,
      this.suffixIcon,
      this.textInputAction,
      this.obscureText,
      this.isRequired,
      required this.labelText,
      this.withOutLabel,
      this.backGroundColor,
      this.padding,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.customLabel,
      this.onTapOutside,
      this.keyboardType,
      this.errorText,
      this.prefixIcon,
      this.minLines,
      this.validator,
      this.subTitle});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,

      //  initialValue: initialValue ?? "data",
      inputFormatters: inputFormatters,
      cursorColor: AppColors.primaryColor,
      readOnly: readOnly ?? false,
      onTap: onTextFieldTap,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      controller: controller,
      onTapOutside: onTapOutside,
      focusNode: focusNode,
      textInputAction: textInputAction,
      minLines: minLines,
      maxLength: maxLength,
      textCapitalization:
          keyboardType == TextInputType.emailAddress || labelText.toLowerCase().contains("password")
              ? TextCapitalization.none
              : TextCapitalization.sentences,
      style: TextStyle(fontWeight: FontWeight.w400),
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
          fillColor: backGroundColor ?? AppColors.boarder,
          filled: true,
          labelText: labelText,
          errorMaxLines: 3,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorText: errorText,
          // error: SizedBox.shrink(),
          hintStyle: CustomTextStyle.subtitleText.copyWith(
            fontSize: getSize(12),
            fontWeight: FontWeight.w300,
          ),
          hintText: hintText,
          labelStyle: CustomTextStyle.subtitleText,
          contentPadding: padding ??
              EdgeInsets.symmetric(
                // vertical: 10,
                horizontal: getSize(15),
              ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.boarder),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(getSize(8)),
              borderSide: BorderSide(color: AppColors.red, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(getSize(8)),
              borderSide:
                  BorderSide(color: Colors.black.withOpacity(0.11999999731779099), width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(getSize(8)),
              borderSide: BorderSide(color: AppColors.red, width: 1)),
          focusedBorder: readOnly == false
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.primaryColor))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(getSize(8)),
                  borderSide:
                      BorderSide(color: Colors.black.withOpacity(0.11999999731779099), width: 1))),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
