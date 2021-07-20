import 'package:bankboo/shared/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final Function onPressed;
  final bool isLoading;
  final String label;
  final Color color;
  final Color labelColor;

  const CustomFilledButton({
    Key key, this.onPressed, this.isLoading, this.label, this.color
    , this.labelColor
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 900, minHeight: 45.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(
              0.0, // horizontal, move right 10
              2.0, // vertical, move down 10
            ),
          ),
        ],
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
            color: onPressed != null ? color : Theme.of(context).disabledColor,
            width: 1.0
          ),
        ),
        disabledColor: isLoading ? Colors.white : Theme.of(context).disabledColor,
        color: color,
        elevation: 0.0,
        focusElevation: 0.0,
        hoverElevation: 0.0,
        disabledElevation: 0.0,
        highlightElevation: 0.0,
        highlightColor: color,
        onPressed: isLoading ? null : onPressed,
        child: isLoading
        ? loading(context, color: color, size: 12.0, width: 25.0, height: 25.0)
        : Text(
          label,
          style: TextStyle(color: labelColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}