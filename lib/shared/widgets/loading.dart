import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

SizedBox loading(
  BuildContext context,
  {
    Color color,
    double size,
    double width,
    double height,
  }
) => SizedBox(
      child: SpinKitThreeBounce(
        color: color,
        size: size,
      ),
      width: width,
      height: height
    );