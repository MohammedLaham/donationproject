import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

mixin ImageHelper {
  Widget AppSvgImage(String svgName,{
     Color? color,
     double? width,
     double? height,
     BoxFit fit = BoxFit.contain,

  } ){
    return SvgPicture.asset('assets/images/$svgName.svg',
      colorFilter: color != null? ColorFilter.mode(color,BlendMode.srcIn):null,
      width: width,
      height: height,
      fit: fit,

    );
  }
}
