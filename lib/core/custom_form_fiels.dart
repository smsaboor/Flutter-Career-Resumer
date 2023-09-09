import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
        required this.maxLimit,
        required this.maxLimitError,
        required this.readOnly,
        required this.controlller,
        required this.errorMsg,
        required this.labelText,
        required this.validator,
        required this.onChanged,
        required this.icon,
        required this.maxLines,
        required this.textInputType})
      : super(key: key);
  final TextEditingController controlller;
  final errorMsg;
  final labelText;
  final icon;
  final textInputType;
  final readOnly;
  final maxLimit;
  final maxLimitError;
  final validator;
  final onChanged;
  final maxLines;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.redAccent,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        maxLines: maxLines,
        readOnly: readOnly,
        controller: controlller,
        validator: validator,
        keyboardType: textInputType,
        onChanged: onChanged,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal)),
            labelText: labelText,
            prefixText: ' ',
            prefixIcon: Icon(
              icon,
              color: Colors.blue,
            ),
            suffixStyle: const TextStyle(color: Colors.green)),
      ),
    );
  }
}