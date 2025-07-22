import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../export.dart';

customDropDown(
    {required var value,
    required var item,
    void Function(Object?)? onChanged,
    double? height,
    double? width,
    String? labelText,
    Widget? customLabel,
    bool showTitle = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customLabel ??
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: labelText ?? "",
                style: CustomTextStyle.bodyText.copyWith(
                  color: AppColors.textGrey,
                  fontSize: getSize(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
              getSizeBox(height: 10),
            ],
          ),
      Container(
        decoration: ShapeDecoration(
          color: AppColors.boarder,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.11999999731779099),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: DropdownButton2(
          buttonStyleData: ButtonStyleData(
            overlayColor: WidgetStatePropertyAll(AppColors.transparent),
            height: height ?? 50,
            width: width ?? double.infinity,
            padding: getPadding(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0,
          ),
          iconStyleData: IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              size: getSize(18),
              color: AppColors.fromHex("#808191"),
            ),
            iconSize: getSize(25),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            offset: const Offset(0, -3),
          ),
          menuItemStyleData: MenuItemStyleData(
            height: getVerticalSize(30),
            padding: getPadding(left: 14, right: 14),
          ),
          value: value,
          items: item,
          hint: Text(
            "Select",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textGrey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          onChanged: onChanged,
          isExpanded: true,
          underline: const SizedBox(),
        ),
      ),
    ],
  );
}

// state.serviceList!.map((ServiceDetails value) {
//       return DropdownMenuItem<ServiceDetails>(
//         value: value,
//         child: Text(
//           value.title ?? "",
//           overflow: TextOverflow.ellipsis,
//         ),
//       );
//     }).toList(),
Widget customDropDown2<T>(List<T> itemList, String Function(T) itemDisplayValue,
    {String? labelText,
    Widget? customLabel,
    String? valueText,
    String? hintText,
    Widget? customTitle,
    final ValueChanged<T?>? onChanged,
    bool enabled = true,
    double? height2,
    String? disableMessage,
    String defaultHintText = "Select",
    List<DropdownMenuItem<T>>? dropDownItems}) {
  return GestureDetector(
    onTap: () {
      if (!enabled) {
        HapticFeedback.vibrate();
        if (disableMessage != null) {
          showToast(disableMessage);
        }
        return;
      }
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customLabel ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: labelText ?? "",
                  style: CustomTextStyle.bodyText.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: getSize(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                getSizeBox(height: 5),
              ],
            ),
        AbsorbPointer(
          absorbing: !enabled,
          child: DropdownButton2<T>(
            dropdownStyleData: DropdownStyleData(
              maxHeight: height / 1.5,
              decoration: BoxDecoration(
                color: AppColors.boarder,
                borderRadius: BorderRadius.circular(14),
              ),
              offset: const Offset(0, -3),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: getVerticalSize(30),
              padding: getPadding(left: 14, right: 14),
            ),
            buttonStyleData: ButtonStyleData(
              overlayColor: WidgetStatePropertyAll(AppColors.backGroundColor),
              height: getVerticalSize(30),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            isExpanded: true,
            underline: const SizedBox(),
            value: null,
            items: dropDownItems ??
                itemList.map((e) {
                  return DropdownMenuItem<T>(
                    value: e,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      itemDisplayValue(e),
                      style: CustomTextStyle.normalText.copyWith(
                        fontSize: getSize(14),
                      ),
                    ),
                  );
                }).toList(),
            onChanged: enabled ? onChanged : null,
            customButton: Container(
              height: height2,
              padding: getPadding(all: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.11999999731779099),
                ),
                color: AppColors.white,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                    child: customTitle ??
                        CustomText(
                          text: valueText == null || valueText.isEmpty
                              ? (hintText ?? defaultHintText)
                              : valueText.capitalize(),
                          maxLines: 1,
                          style: valueText != null
                              ? TextStyle(
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : CustomTextStyle.subtitleText.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: getSize(14),
                                ),
                        ),
                  )),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.primaryColorDark,
                    size: getSize(20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customDropDownSearch<T>(
    List<T> itemList, String Function(T) itemDisplayValue,
    {String? labelText,
    Widget? customLabel,
    String? valueText,
    String? hintText,
    required TextEditingController searchController,
    ValueChanged<T?>? onChanged,
    bool enabled = true,
    double? height,
    required SuggestionsBoxController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DropDownSearchFormField<T>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: searchController,
          onChanged: (value) {
            onChanged?.call(null);
          },
          decoration: InputDecoration(
              hintText: valueText ?? hintText ?? "Select customer",
              fillColor: AppColors.boarder,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.boarder),
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(getSize(8)),
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.11999999731779099),
                      width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.primaryColor))),
        ),
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
          closeSuggestionBoxWhenTapOutside: true,
          elevation: 2,
        ),
        suggestionsCallback: (pattern) {
          return itemList
              .where((element) => itemDisplayValue(element)
                  .toLowerCase()
                  .contains(pattern.toLowerCase()))
              .toList();
        },
        itemBuilder: (context, item) {
          return Padding(
            padding: getPadding(all: 10),
            child: Text(itemDisplayValue(item)),
          );
        },
        itemSeparatorBuilder: (context, index) {
          return const Divider(
            height: 1,
          );
        },
        transitionBuilder: (context, suggestionsBox, controller) {
          return suggestionsBox;
        },
        onSuggestionSelected: (T? suggestion) {
          onChanged!(suggestion);
        },
        suggestionsBoxController: controller,
        validator: (value) => value!.isEmpty ? "" : null,
        onSaved: (value) => onChanged!(value as T),
        displayAllSuggestionWhenTap: true,
      ),
    ],
  );
}

Widget customSearchableDropdown<T>(
  List<T> itemList, {
  String? labelText,
  T? selectedValue,
  ValueChanged<T?>? onChanged,
  bool enabled = true,
  String? hintText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (labelText != null)
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            labelText,
            style: CustomTextStyle.bodyText.copyWith(
              color: AppColors.primaryColor,
              fontSize: getSize(14),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      DropdownSearch<String>(
        // key: dropDownKey,
        selectedItem: "Menu",
        filterFn: (item, filter) => true,

        items: (filter, infiniteScrollProps) =>
            ["Menu", "Dialog", "Modal", "BottomSheet"],
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            labelText: 'Examples for: ',
            border: OutlineInputBorder(),
          ),
        ),
        popupProps:
            PopupProps.menu(fit: FlexFit.loose, constraints: BoxConstraints()),
      )
      // DropdownSearch<String>(
      //   selectedItem: selectedValue?.toString(),
      //   onChanged: (value) {
      //     try {
      //       CountryModel? tempData = itemList.firstWhere(
      //         (e) => (e as CountryModel).countryName == value,
      //       )as CountryModel;
      //       onChanged?.call(tempData as T);
      //     } catch (E) {
      //       onChanged?.call(null);
      //     }
      //   },
      //   dropdownBuilder: (context, selectedItem) => ,
      //   items: (filter, infiniteScrollProps) => itemList
      //       .map(
      //         (e) => (e as CountryModel).countryName ?? "",
      //       )
      //       .toList(),
      //   decoratorProps: DropDownDecoratorProps(
      //     decoration: InputDecoration(
      //       labelText: 'Examples for: ',
      //       border: OutlineInputBorder(),
      //     ),
      //   ),
      //   popupProps:
      //       PopupProps.menu(fit: FlexFit.loose, constraints: BoxConstraints()),
      // )
    ],
  );
}
