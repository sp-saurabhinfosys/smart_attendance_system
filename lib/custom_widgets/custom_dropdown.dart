import 'package:flutter/material.dart';
import 'package:smart_attendance_system/utils/utils.dart';

class CustomDropDown extends StatelessWidget {
  final List list;
  final String value;
  final Function(String) onChanged;
  final bool isAlign;
  final Widget hint;
  final FormFieldValidator validator;

  CustomDropDown({
    this.list,
    this.onChanged,
    this.value,
    this.isAlign,
    this.hint,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      items: list,
      onChanged: onChanged,
      validator: validator,
      hint: hint,
      value: value,
      isDense: true,
      decoration: InputDecoration(
        hintMaxLines: 2,
        isCollapsed: true,
        isDense: true,
        hintStyle: TextStyle(fontSize: 12, color: MyColors.greyColor),
        border: new UnderlineInputBorder(borderSide: new BorderSide(color: MyColors.greyColor, width: 1.3)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.greyColor, width: 1.3),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.greyColor, width: 1.3),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.greyColor, width: 1.3),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.greyColor, width: 1.3),
        ),
        contentPadding: EdgeInsets.only(left: 0, bottom: 0, top: 14, right: 0),
      ),
    );
  }
}
