import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utility/image_assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(53),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 100,
            offset: Offset.zero,
          ),
        ],
      ),
      child: SvgPicture.asset(
        ImageAssets.myCampusLogoSVG,
      ),
    );
  }
}
