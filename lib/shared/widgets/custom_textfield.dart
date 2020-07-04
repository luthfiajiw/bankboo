import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isFilled;
  final bool autofocus;
  final bool obscureText;
  final Function onTap;
  final Function onSaved;
  final Function validator;
  final FocusNode focusNode;
  final EdgeInsetsGeometry contentPadding;
  final Icon prefixIcon;
  final Widget suffixIcon;

  const CustomTextField({
    Key key, this.label, this.hintText, this.isFilled, this.autofocus, this.obscureText,this.contentPadding,
    this.focusNode, this.onTap, this.onSaved, this.validator, this.prefixIcon, this.suffixIcon
  }) : super(key: key);

  TextFormField textFormField() {
    return TextFormField(
      decoration: InputDecoration(
        filled: isFilled == null ? false : isFilled,
        fillColor: Palette.textBlack,
        hintStyle:  TextStyle(color: Palette.textHint),
        hintText: hintText,
        contentPadding: contentPadding == null ? EdgeInsets.all(17) : contentPadding,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: isFilled != null  ? isFilled ? Palette.borderDefault : Palette.textHint : Palette.borderDefault, width: 1.0)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: isFilled != null  ? isFilled ? Palette.borderDefault : Palette.textHint : Palette.borderDefault, width: 1.0)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          // borderSide: BorderSide(color: Palette.textHint, width: 2.0)
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon
      ),
      style: TextStyle(color: Palette.textBlack),
      autofocus: autofocus == null ? false : autofocus,
      focusNode: focusNode,
      onTap: onTap,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText ?? false,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: label == null
      ? textFormField()
      : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(label, style: TextStyle(color: Theme.of(context).textTheme.title.color, fontSize: 10.0)),
          ),
          textFormField()
        ],
      )
    );
  }
}