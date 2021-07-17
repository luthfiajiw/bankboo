import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function onTap;
  final EdgeInsets margin;

  const Menu({Key key, this.title, this.icon, this.onTap, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: margin,
        height: 125,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Palette.g0, Palette.g2]
          ),
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
                        padding: const EdgeInsets.only(top: 14.0),
                        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
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