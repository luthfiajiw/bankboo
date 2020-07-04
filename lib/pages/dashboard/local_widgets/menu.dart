import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function onTap;

  const Menu({Key key, this.title, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 125,
        decoration: BoxDecoration(
          color: Palette.grey.withOpacity(0.07),
          borderRadius: BorderRadius.circular(15)
        ),
        child: ClipRRect(
          borderRadius:  BorderRadius.circular(15),
          child: Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                splashColor: Palette.grey.withOpacity(0.1),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      icon,
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(title, style: TextStyle(color: Palette.textBlack, fontWeight: FontWeight.w500),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}