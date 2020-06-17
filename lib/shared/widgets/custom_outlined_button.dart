import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Color color;
  final Color labelColor;

  const CustomOutlineButton({Key key, this.onPressed, this.label, this.color, this.labelColor}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: double.infinity, minHeight: 54.0),
      child: OutlineButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: color,
        highlightedBorderColor: color,
        highlightElevation: 0.0,
        borderSide: BorderSide(color: color),
        child: Text(
          label,
          style: TextStyle(color: labelColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}