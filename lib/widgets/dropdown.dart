import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';

String? selectedValue;

class DropDownList extends StatefulWidget {
  const DropDownList({super.key, required this.dropdownItems});
  final List<String> dropdownItems;

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                'Select an option',
                style: AppFonts.smallRegularText(context),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        items: widget.dropdownItems
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AppFonts.smallRegularTextBlack(context),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        selectedItemBuilder: (BuildContext context) {
          return widget.dropdownItems.map((String item) {
            return Center(
              child: Text(
                item,
                style: AppFonts.smallRegularText(context),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList();
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            gradient: containerGradient(),
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 2,
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 20,
          iconEnabledColor: AppColor.white,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 150,
          width: MediaQuery.sizeOf(context).width * 0.725,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColor.white,
          ),
          offset: const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStatePropertyAll(6),
            thumbVisibility: WidgetStatePropertyAll(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
