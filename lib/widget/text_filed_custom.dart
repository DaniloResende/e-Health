import 'package:ehealthapp/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class TextFieldCustom extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onFieldChanged;
  final Function(String)? onFieldSubmit;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focus;
  final Color color;
  final Color colorText;
  final double fontSize;
  final TextInputType textInputType;
  final bool enable;
  final IconData? suffixIcon;
  final String hint;
  final String label;

  TextFieldCustom({
    required this.textEditingController,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.suffixIcon,
    this.hint = '',
    this.label = '',
    this.padding,
    this.inputFormatters,
    this.onFieldChanged,
    this.onFieldSubmit,
    this.focus,
    this.fontSize = 14,
    this.enable = true,
    this.color = colorTextField,
    this.colorText = primaryColor,
  });

  _setFocusListener() {
    focus!.addListener(
          () {
        if (focus!.hasFocus) {
          textEditingController.selection = TextSelection(
              baseOffset: 0,
              extentOffset: textEditingController.value.text.length);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.0,bottom: 8),
          child: Text(label,style:  TextStyle(fontWeight: FontWeight.bold,color: colorText),),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          enabled: enable,
          keyboardType: textInputType,
          style: TextStyle(fontSize: fontSize,color: Colors.black),
          textInputAction: textInputAction,
          focusNode: focus,
          onChanged: onFieldChanged != null
              ? (String string) => onFieldChanged!(string)
              : null,
          onFieldSubmitted: onFieldSubmit != null
              ? (String string) => onFieldSubmit!(string)
              : null,
          controller: textEditingController,
          inputFormatters: [UpperCaseTextFormatter(), ...inputFormatters != null ? inputFormatters! : List.empty()],
          decoration: InputDecoration(
            labelText: hint,
            suffixIcon:suffixIcon != null ?   Padding(
              padding: const EdgeInsets.only(right:10), // add padding to adjust icon
              child: Icon(suffixIcon,size: 32,),
            ) : null,
            filled: true,
            fillColor: color,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}





